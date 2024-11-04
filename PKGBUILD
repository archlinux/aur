# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=visioncortex
_pkgname=vtracer
pkgname=${_pkgname}-bin
pkgver=0.6.4
pkgrel=1
pkgdesc='Raster to Vector Graphics Converter'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "CHANGELOG-${pkgver}.md::${_urlraw}/CHANGELOG.md")
source_x86_64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-musl.tar.gz")
source_aarch64=("${url}/releases/download/${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-musl.tar.gz")
sha256sums=('0a951222fe1bce97214a470d5074b246157ed9bd6d3062b9dad358c13e09acd0'
            '904cfa4bd842247dfa58352c10dbe8c50584d88f536a604d3e996d89b3542879'
            'a5a6ed5b307bf1d0570a1119c79c0a8a4f8088d040c8916165a28ac459f4bbd0')
sha256sums_x86_64=('9290ba0c90e224d6d212836dff5491407c1718bcb72f80b2b5a4a01816df5e40')
sha256sums_aarch64=('cbd05ad4f491d12dd139ada61485ca1d24db9f981cbe1658632a083cd0ac1a71')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-info
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
