# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

pkgname=xiangqilab
pkgver=1.2.0
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
sha256sums=("fb04ecdf9910b1158e97309c073b7529b576112cc14efe6ca4cdd4bafef453f4")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m build --no-isolation --wheel
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/$pkgname.png"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
