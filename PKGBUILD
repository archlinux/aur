# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=noborus
_pkgname=guesswidth
pkgdesc='Guess the width (fwf) output without delimiters in commands that output to the terminal.'
pkgver=0.6.0
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
sha256sums_x86_64=('799445946f0663419f7b3a1e966a27a54ea83172560482f9a06c9c76fe987b2d')
sha256sums_i686=('15d90c5fdd2ed476a17422d4a950d95c01b24c1e6e94654d8ce29621a9dde4f1')
sha256sums_aarch64=('bef971d1747794af1e635c674c1bc2c9d7ec2a5324cf8c69d2ccf1e7035293ac')

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
