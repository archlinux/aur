# Maintainer: Matthew McGinn <mamcgi@gmail.com>
_projectname='electron'
_pkgname="${_projectname}7"
pkgname="${_pkgname}-bin"
pkgver='7.1.13'
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
sha256sums_x86_64=('56a2420bf3948e0d4012bc38dbf0f46f84d978f7d0ddab3236aed7b18bd08c24'
                   '3acc071c90cb3d081aebd0f304727f7352af314ccbc3b077de0ff3c2816cebea')
sha256sums_i686=('4494d88a4ed9645b48a996a1d879d6a2e09af0da2df6815eeb0d51f7dbff7fbe'
                 '3c7d41603a1699f17f2ca2235ea615da331599acad4912948b2fbac3b91f9dab')
sha256sums_armv7h=('b405de36982c19b6cfdd41ec16d508c00c65001982625a263f026c48fb6c1e6a'
                   'c784cfca9ce656140a5d75b0be030f1fa03bf9c1302d8e5e301856ab2bc607ea')
sha256sums_aarch64=('1c8b51c914529a8e178d0a5adc86eadf8fc1c4a64245bca1ea9467bfb2741f5c'
                    '9832cd3b88332c04d495572039d52f0e0341572fb9357e378e70a11119db4e32')

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
