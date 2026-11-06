# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=noborus
_pkgname=guesswidth
pkgdesc='Guess the width (fwf) output without delimiters in commands that output to the terminal.'
pkgver=0.7.0
pkgrel=1
pkgname=${_pkgname}-bin

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"

arch=('x86_64' 'i686' 'aarch64')
license=('MIT')

depends=('glibc')
makedepends=('help2man')
provides=("${_pkgname}")
conflicts=("${_pkgname}")

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('afcb1af4d492525f0eab04b3f2c28781710393d6b0f932521f87b531a99680ff'
            '4c0f3a18ed3b0abcd5ae6ed620ec4da1c034d6f0995419ab7c23b662b90d1495')
sha256sums_x86_64=('111a0d82e1ae3271097853709fe6a0118d29f8c3fe1b929793ef89ec7c9b307f')
sha256sums_i686=('d87696ed96f8c30025b16b5265a3a0e491873e335421cf36480a395357302b62')
sha256sums_aarch64=('68939557f45fcda4ba5133d517e2831d415c164e21b25a8da90350b2d4ef69bb')

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
