# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}8"
pkgname="${_pkgname}-bin"
pkgver='8.2.3'
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
sha256sums_x86_64=('f9cd85c9457b637100485e21c64cafd261764e81667e21d041a699aae08366f1'
                   'e65b260684d373101b448554cf78fe0ce170121ed766ec548fd82b7b7bdf160e')
sha256sums_i686=('fa3fd3975d04b655cf6d3fe7471d38061a99b5e40380757dc977186f9c7d8c64'
                 'ab83fde18e485852cc4873e319ad9e7e0de0d4a0593ad0f04d67c93094c2a9f0')
sha256sums_armv7h=('76e4e9fde4c14847f51f84479a1572eeca6c96326ef3b745eabd9c0ad7b8d0f2'
                 'aa722eebd61f0c2beeeff743c9089b244c5f01f171a46b8a24c5d5107b604738')
sha256sums_aarch64=('d9c638b657f1fa4cf672b9d14d2203bc5effe06af05399d91390cdd643a1ac51'
                    '08d7ef5fb238be2a3c9fe692ccbfa681d614a94b6b60af5003c384a7d5611d53')

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
