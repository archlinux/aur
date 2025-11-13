# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ivaaaan
_pkgname=smug
pkgname=${_pkgname}-bin
pkgver=0.3.12
pkgrel=1
pkgdesc='A session manager for tmux written in Go'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_x86_64=('f14835192502c3403ada2cdd6908ce6fbca27c8bc11938d7ad93c5f8f72fe53b')
sha256sums_i686=('aa5c69e146d9fd811b2aa8a676d15deedbc3a8ec38edd92a223bff721f13fb71')
sha256sums_aarch64=('7057386c2d6c267b22fea19c99d74e1a0cc10750e8258848c4f7db7f644722d9')

build() {
  cd "${srcdir}/" || exit

  help2man ./${_pkgname} --output "MAN-${pkgver}.1" --no-discard-stderr
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
  gzip "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
