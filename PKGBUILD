# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

pkgname=xiangqilab
pkgver=1.0.1
pkgrel=1
epoch=
pkgdesc="A fully local Xiangqi desktop app"
arch=("any")
url="https://gitlab.com/xiangqilab/xiangqilab"
license=("AGPL-3.0-or-later")
groups=()
depends=("python" "tk")
makedepends=("python-build" "python-installer" "python-wheel")
checkdepends=()
optdepends=(
  "fairy-stockfish: Chess AI engine with Xiangqi support"
  "fairy-stockfish-xiangqi-nnue: Xiangqi neural network"
)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz::https://gitlab.com/xiangqilab/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
noextract=()
validpgpkeys=()
sha256sums=("57e12a53f5e6c6f1513d367749dda09e35653220822e8a9cad079b3a290895bc")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m build --no-isolation --wheel
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/xiangqilab/app_icon/app_icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
