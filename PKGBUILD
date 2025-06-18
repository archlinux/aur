#Maintainer:AyoVizzion@protonmail.com
#Contributer:
_pkgname="yanix-launcher"
pkgname="yanix-launcher-git"
pkgver=v0.7
pkgrel=1
pkgdesc="Yandere Simulator Launcher For Linux"
arch=('x86_64')
url="https://nikoyandere.github.io"
license=('NLV2')
depends=(
  'python-pyqt5'
  'python-pyqtwebengine'
  'python-pywebview'
  'python-requests'
  'wine'
)
makedepends=('git')
optdepends=('python-pypresence')

_pkgsrc=$_pkgname
source=("$_pkgsrc::git+https://github.com/NikoYandere/yanix-launcher.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgsrc"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$srcdir/$_pkgsrc"

  install -Dm755 "binary/yanix-launcher.py" "$pkgdir/usr/bin/yanix-launcher"

  mkdir -p "$pkgdir/usr/share/yanix-launcher"

  for datafile in "binary/data/*.png" "binary/data/*.mp3" "binary/data/*.txt"; do
    install -Dm644 $datafile "$pkgdir/usr/share/yanix-launcher/"
  done

  install -Dm755 "binary/data/test.py" "$pkgdir/usr/share/yanix-launcher/"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "$pkgdir/usr/share/applications"
  cat << EOF > "$pkgdir/usr/share/applications/yanix-launcher.desktop"
[Desktop Entry]
Name=Yanix Launcher
Comment=Yandere Simulator Launcher for Linux
Exec=$pkgdir/usr/bin/yanix-launcher
Icon=$pkgdir/usr/share/yanix-launcher/data/icons/Yanix-Launcher.png
Terminal=false
Type=Application
Categories=Game;Utility;
EOF
}
