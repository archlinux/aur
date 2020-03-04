# Maintainer: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}7"
pkgname="${_pkgname}-bin"
pkgver='7.1.14'
pkgrel='1'
pkgdesc='Build cross platform desktop apps with web technologies - version 7 - binary version'
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
sha256sums_x86_64=('b03e1676a3ce9dafe361e578f713b5aca13b73e4d2a704531bb9c3ba4624b7ba'
                   'eff2b4ab67cf9bed50e02826afe00653263efa770176a9a08c581854248ecfc1')
sha256sums_i686=('aada2c620b5ed2843521a3f3c5c4288525cdf1d36c63afb478460cb6fb378ae3'
                 '6095fd76347b0e9b1af1c46dfc27e7641d1dcc6f7760132547af8098673cdb14')
sha256sums_armv7h=('a40c0f7ea16feac45c01dba16ba246ff66d45a36f3ec10a7ef262458d14bf664'
                   'e30f09a025043c328ceff02f041defce27f35bc4183bc358c668214c872611ae')
sha256sums_aarch64=('4f0580487074a39740de939de0a89faef744792c736aad203e9e28c76db7f84a'
                    'dc5b31a00f1ff72eb32c533dd2510f9378c60b460261570487a3b86b4d0c4d4d')

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
