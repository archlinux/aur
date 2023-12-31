# Maintainer: Dummerle

pkgname=rare
pkgver=1.10.11
pkgrel=1
pkgdesc="A GUI for legendary, an open source replacement for Epic Games Launcher"
arch=('any')
url="https://github.com/RareDevs/Rare"
license=('GPL3')
depends=(
  python-pyqt5
  qt5-svg
  python-qtawesome
  python-requests
  python-typing_extensions
  python-orjson
  legendary
)
makedepends=(
  git
  python-{build,installer,wheel}
  python-setuptools
)
optdepends=(
  "wine: run Windows games"
  "proton: run Windows games"
  "python-pypresence: Discord RPC integration"
  "python-pywebview: embedded browser for logging in"
)
source=("git+https://github.com/RareDevs/Rare.git#tag=$pkgver")
sha256sums=("SKIP")

build() {
  cd Rare
  python -m build -wn
}

package() {
  cd Rare
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm644 "misc/${pkgname%-git}.desktop" "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
  install -Dm644 "rare/resources/images/Rare.png" "$pkgdir/usr/share/pixmaps/${pkgname%-git}.png"
}
