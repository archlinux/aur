pkgname=primespecpcr
_name=PrimeSpecPCR
pkgver=0.0.1
pkgrel=1
pkgdesc="Species-Specific Primer Design Toolkit."
arch=('any')
url="https://github.com/Adv20202/PrimeSpecPCR"
license=('MIT')
depends=('mafft' 'python' 'python-construct' 'python-biopython' 'primer3-py' 'python-pandas' 'python-numpy' 'python-tqdm' 'python-validators' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("git+https://github.com/Adv20202/PrimeSpecPCR.git")
md5sums=('SKIP')

#uild() {
# cd "$srcdir/$_name"
#python -m build
#

build() {
  cd "$srcdir/$_name"
  # Instead of doing the full ./bootstrap.sh
  python3 -m venv env --system-site-packages
  source env/bin/activate
  python3 -m pip install -r requirements.txt
  msg "Starting build..."
  python build_executable.py --clean
}

package() {
  cd "$srcdir/$_name"
#    python -m installer --destdir="$pkgdir" dist/*.whl

#	install -Dp -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
#	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
#  cp -R "help" "build"
#  cp -R "locale" "build"
#  python package.py --arch-pkg
#  cd "build/${pkgname}-arch"


#  mkdir -p "${pkgdir}/usr/share/applications"
#  mv ${pkgname}.desktop "${pkgdir}/usr/share/applications"
  
  mkdir -p "${pkgdir}/usr/share/${pkgname}"
  cp -a -- * "${pkgdir}/usr/share/${pkgname}/"
  chmod a+x "${pkgdir}/usr/share/${pkgname}/run.py"
  
#  mkdir -p "${pkgdir}/usr/share/pixmaps"
#  ln -s "/usr/share/${pkgname}/dgse_logo_128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  mkdir -p "${pkgdir}/usr/bin"
#  ln -s ../share/${pkgname}/run.py "${pkgdir}/usr/bin/${pkgname}"
  ln -s ../share/${pkgname}/PrimeSpecPCR "${pkgdir}/usr/bin/${pkgname}"
      # Install desktop entry
  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/${pkgname}.desktop" << 'EOF'
[Desktop Entry]
Name=PrimeSpecPCR
Comment=Species-Specific Primer Design Toolkit
Exec=primespecpcr
Icon=applications-games
Terminal=false
Type=Application
Categories=Game;Utility;
EOF
}

# vim: set ft=sh ts=4 sw=4 noet:
