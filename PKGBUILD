# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=dduan
_pkgname=tre
pkgname=${_pkgname}-command-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Tree command, improved.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}-command")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-x86_64-unknown-linux-musl.tar.gz")
sha256sums=('ebad6b24258198516794d838ac82db718e9466c1c73f408ab42038daf3cc7b58'
            '46123f59ab74e57f0c235f37a8ba81a5de054c7b4cc0942cbccb3022343e99f7'
            'a75df6375e94f00941b64889bb4037778e908b2f8af6ce7d622f366c5f7963dc')
sha256sums_x86_64=('47b6b20db6cba7114628c024d00ca842ea9ea9eeb1678facd2468fe60b266bac')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "CHANGELOG-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
