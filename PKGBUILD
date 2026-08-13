# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sibprogrammer
_pkgname=xq
pkgname=${_pkgname}-bin
pkgver=1.5.0
pkgrel=1
pkgdesc='Command-line XML and HTML beautifier and content extractor'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}" 'yq')
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('9bd0ac2fc09d545f5456a74f17bb7a17aea954ad74c1627a14187149747eb37d'
            '39e76a5b7bc49b44f728191b35aad2183de1773b3f94405a57e1520700b84aef')
sha256sums_x86_64=('217acb7b25fa32af9d10cab492695e4887378283535df84459e5c436bf090ea4')
sha256sums_i686=('81194ed5b59d6486ab708887e8134724c74f20004f6db55a9cc89dda1ce5848d')
sha256sums_aarch64=('0b0f071e0fc20baa7851a6c83747c8b46ad3e564813b8d5704364d2aa52ae794')

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
