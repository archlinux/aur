# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}9"
pkgname="${_pkgname}-bin"
pkgver='9.0.0'
pkgrel='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 8 - binary version'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://${_projectname}js.org/"
license=('MIT')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('c-ares' 'ffmpeg' 'gtk3' 'http-parser' 'libevent' 'libxslt' 'libxss' 'minizip' 'nss' 'snappy')
optdepends=(
 'kde-cli-tools: file deletion support (kioclient5)'
 'trash-cli: file deletion support (trash-put)'
 "xdg-utils: open URLs with desktop's default (xdg-email, xdg-open)"
)
_releaseurl="https://github.com/${_projectname}/${_projectname}/releases/download/v${pkgver}"
source_x86_64=(
 "${pkgname}-chromedriver-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-x64.zip"
 "${pkgname}-${pkgver}-${pkgrel}-x86_64.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-x64.zip"
)
source_i686=(
 "${pkgname}-chromedriver-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-ia32.zip"
 "${pkgname}-${pkgver}-${pkgrel}-i686.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-ia32.zip"
)
source_armv7h=(
 "${pkgname}-chromedriver-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-armv7l.zip"
 "${pkgname}-${pkgver}-${pkgrel}-armv7h.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-armv7l.zip"
)
source_aarch64=(
 "${pkgname}-chromedriver-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/chromedriver-v${pkgver}-linux-arm64.zip"
 "${pkgname}-${pkgver}-${pkgrel}-aarch64.zip::${_releaseurl}/${_projectname}-v${pkgver}-linux-arm64.zip"
)
sha256sums_x86_64=('7d8473e3ef9646cfbc7f9070e3d94d4c7166e6ef8ee7eb495cf62af913e02e6e'
                   '03c69d66ae8784edcc6a4b8081eb4e07da802035a6257fb6e2260a456371224f')
sha256sums_i686=('2770f204adc90dcfa9a6c5e1bc0d079ce3643b477c1d617b780195bb3111db57'
                 '67ea9e04db5a709b10d2f101d977e803b5f5da9e9573cbcc7bce362b1a9406d7')
sha256sums_armv7h=('9174bd832bcdfa2e14b633e50310ee09703f53938143196be0eb2df602ba3122'
                   '7917624b81318197da52de04073e07c4b2d3947737d4103f647a8abc907600c0')
sha256sums_aarch64=('194b72f257d8c61fbcfb0174966777136a6ecb26e3a2b65d19b2ef74df99d391'
                    'e3dd2e15cfd346a59c69ff4b0b234daf5bb06790b508ae0056a55c17eef78a9e')

package() {
 cd "$srcdir/"
 install -dm755 "${pkgdir}/usr/lib/${_pkgname}/"
 find . -mindepth 1 -maxdepth 1 -type f ! -name "*.zip" ! -name "LICENSE*" -exec cp -r --no-preserve=ownership --preserve=mode -t "${pkgdir}/usr/lib/${_pkgname}/." {} +
 cp -r --no-preserve=ownership --preserve=mode 'locales/' "${pkgdir}/usr/lib/${_pkgname}/locales/"
 cp -r --no-preserve=ownership --preserve=mode 'resources/' "${pkgdir}/usr/lib/${_pkgname}/resources/"

 install -dm755 "${pkgdir}/usr/bin"
 ln -nfs "/usr/lib/${_pkgname}/${_projectname}" "${pkgdir}/usr/bin/${_pkgname}"

 install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
 install -Dm644 'LICENSES.chromium.html' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
}
