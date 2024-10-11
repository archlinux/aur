# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=ivaaaan
_pkgname=smug
pkgname=${_pkgname}-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='A session manager for tmux written in Go'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}.${pkgver}._Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}.${pkgver}._Linux_i386.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}.${pkgver}._Linux_arm64.tar.gz")
sha256sums_x86_64=('2829c441981194759c1d50099fd01023d63199f19f024718c5167b0859e211c4')
sha256sums_i686=('bf9b020bf0614937f47ef98557f2d02d38d807e139a7409231d4b84b17a56708')
sha256sums_aarch64=('55935df00fbefb87133e4ecac4a05d823b6b89e24b473bf9576ab7f3c6753ef1')

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
