# Maintainer: bartec <swierkdeck@gmail.com>
pkgdesc="Lightweight and configurable serial terminal application built with PyQt6"
pkgname=tcterm
pkgver=1.0.0
pkgrel=1
epoch=
url="https://github.com/bswiercz/tcterm"
arch=('any')
license=('MIT')
depends=(python python-pyqt6 python-pyserial python-xdg-base-dirs)
makedepends=(git python-build python-installer python-wheel)
provides=(tcterm)
source=("git+${url}.git#branch=master")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  mkdir -p "$pkgdir/usr/share/applications/"
  touch "$pkgdir/usr/share/applications/${pkgname}.desktop"
  cat > "$pkgdir/usr/share/applications/${pkgname}.desktop" <<EOL
[Desktop Entry]
Name=TCTerm
Comment=That Composite Terminal
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Utility;
EOL
  install -Dm644 icon.png "$pkgdir/usr/share/pixmaps/${pkgname}.png"
}
