# Maintainer: Tom Vincent <http://tlvince.com/contact/>
_projectname='electron'
_pkgname="${_projectname}9"
pkgname="${_pkgname}-bin"
pkgver='9.0.2'
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
sha256sums_x86_64=('01f4f472f83ba8bfc96b90f07e6a9c266ea4c374cfbc756aa5f6c9ecf9efd06f'
                   '08326f505692010d6c92f444a25f450cf19323cd98c5d94cab1057e80601caa1')
sha256sums_i686=('ba1fa9e955fa945e75285ec80a8bc590bad135f701402e7ffb994328846216c2'
                 '2e950e4ab91453f7611fcfedbe90eff844677dbcc7df87a6fe0889bd3d82daaa')
sha256sums_armv7h=('ef67dbd09e4b64b0e3c071f64482a34e4241772fb1939922f0cbef320d2cea67'
                   'cc098caebbed5022f26d12f9b5dc316a35dbae0bcf62b9fc72c3b385f93a32d5')
sha256sums_aarch64=('e05b51f84abc4660c83958f9c1f33c6f8f54f40a16206c56c3fd4b71fea26569'
                    'ee39854d8e9ee06e9b94c457a52b0556f570316bbd755d7022e3eade4b5974d5')

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
