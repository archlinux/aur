# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=Jojo4GH
_pkgname=nav
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='The interactive and stylish replacement for ls & cd!'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=('glibc' 'gcc-libs' 'libxcrypt-compat')
makedepends=('help2man')
conflicts=("${_pkgname}" "${_pkgname}-cli")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[0]}-unknown-linux-gnu.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-${arch[1]}-unknown-linux-gnu.tar.gz")
sha256sums=('d5532d342ac8c329541cd225a66c5cfdcac577dbb400024cae4b5195ba5e95ea'
            '3687e2dda0a15b39d4a19cf8e7e64226fb8c55b3fb35640e1b979daf748252ec')
sha256sums_x86_64=('4ff8264157ad3e85bebde5664011e7bf9e947ad88c517528254edfdadf723151')
sha256sums_aarch64=('b9e11e6a2506c7e65b4f2c0dac2304219975ccdc617e6650b8dfc6918a620b54')

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
