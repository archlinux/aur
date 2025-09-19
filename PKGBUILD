# Maintainer: gladon4 <mcgoldhand at gmail dot com>
pkgname=typstwriter
pkgver=0.3   
pkgrel=2
pkgdesc="Typstwriter: GUI frontend/writer using Typst + Qt"
arch=('any')
url="https://github.com/Bzero/typstwriter"
license=('MIT')  
depends=(
  'python'
  'python-qtpy'
  'python-pyqt6'    
  'pyside6'
  'python-pygments'
  'qt6-webengine'
)
makedepends=(
  'git'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-flit-core'
)
source=(
  "typstwriter-${pkgver}.tar.gz::https://github.com/Bzero/typstwriter/archive/refs/tags/V${pkgver}.tar.gz"
)
sha256sums=('SKIP')  

build() {
  cd "$srcdir/typstwriter-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/typstwriter-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 /dev/null "$pkgdir/usr/share/applications/typstwriter.desktop"
    
    # Add desktop entry
    cat > "$pkgdir/usr/share/applications/typstwriter.desktop" <<EOF
[Desktop Entry]
Name=Typstwriter
Comment=GUI frontend/writer for Typst
Exec=typstwriter
Icon=typstwriter
Type=Application
Categories=Office;Utility;
Terminal=false
EOF

mkdir -p "$pkgdir/usr/share/icons/hicolor/scalable/apps"
    install -Dm644 "$srcdir/typstwriter-${pkgver}/typstwriter/icons/typstwriter.svg" \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/typstwriter.svg"
}
