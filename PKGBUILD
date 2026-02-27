# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=sibprogrammer
_pkgname=xq
pkgname=${_pkgname}-bin
pkgver=1.4.0
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
sha256sums=('394421490c78d4bdc96539abe41466a3d5716dc1a624e6a531b886756edba64d'
            'f4fa99ba3b21730b6c5ca5c9fc3df3328cd0647f4316737e6761f007219b1f39')
sha256sums_x86_64=('467e83864c3cf70a3a0754cd08070d21fa4b5fbccb8eb10ac3d7ea499fa48217')
sha256sums_i686=('12c39cbc035d8d17970f3f31ca7e27bbb759b1b9f8ff7bada653db3d421a690c')
sha256sums_aarch64=('d511ce8cb96fd7bf2d01e172d19b5d831a49fd7d6adf4106072ccab885bc4202')

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
