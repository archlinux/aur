# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=noborus
_pkgname=guesswidth
pkgname=${_pkgname}-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Guess the width (fwf) output without delimiters in commands that output to the terminal.'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums=('afcb1af4d492525f0eab04b3f2c28781710393d6b0f932521f87b531a99680ff'
            '4c0f3a18ed3b0abcd5ae6ed620ec4da1c034d6f0995419ab7c23b662b90d1495')
sha256sums_x86_64=('b4b6ddc15478cd812dfc1829c6604b2884c40b58c2e06a32e98fab87076d299c')
sha256sums_i686=('de99d080827dbb8eeb948b53d7e652e6bdfb8d3e69acf3055ed00d69e3f7f685')
sha256sums_aarch64=('75a70bcef7c14dc227ad09c76405bc16e2e9e9f87f10000601b244779b4a5a33')

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
