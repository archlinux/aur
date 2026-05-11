# Maintainer: Homer Xing <homer dot hsing @t gmail dot com>

pkgname=xiangqilab
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A fully local Xiangqi desktop app with AI-powered analysis"
arch=("any")
url="https://gitlab.com/xiangqilab/xiangqilab"
license=("AGPL-3.0-or-later")
groups=()
depends=("python" "tk")
makedepends=("python-build" "python-installer" "python-wheel" "gendesk")
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
sha256sums=("3dda8e315aae0a12bf5795b187c3592ac821c06c65081d1768d895376716325b")

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
          --name="Xiangqi Lab" \
          --exec="$pkgname" \
          --comment="A fully local Xiangqi desktop app with AI-powered analysis" \
          --categories="Game;" \
          --icon="$pkgname" \
          --terminal="false" \
          --genericname="Chinese Chess"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
