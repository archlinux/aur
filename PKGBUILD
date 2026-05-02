# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

pkgname=xiangqilab
pkgver=0.1.0
pkgrel=1
epoch=
pkgdesc="An awesome XiangQi desktop app with AI-powered analysis"
arch=("any")
url="https://gitlab.com/xiangqilab/xiangqilab"
license=("AGPL-3.0-or-later")
groups=()
depends=("python" "tk")
makedepends=("python-build" "python-installer" "python-wheel" "gendesk")
checkdepends=()
optdepends=(
  "fairy-stockfish: Chess AI engine with XiangQi support"
  "fairy-stockfish-xiangqi-nnue: XiangQi neural network"
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
sha256sums=("e4824a89e08c96446f20cb7894addc69604b8839079139003b72d9678aae01e1")

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m build --no-isolation --wheel
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  python3 -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 src/xiangqilab/app_icon/app_icon.png "${pkgdir}/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
  gendesk --pkgname "$pkgname" \
          --name="XiangQi Lab" \
          --exec="$pkgname" \
          --comment="An awesome XiangQi desktop app with AI-powered analysis" \
          --categories="Game;" \
          --icon="$pkgname" \
          --terminal="false" \
          --genericname="Chinese Chess"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
