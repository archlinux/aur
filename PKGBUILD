# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_name=sift
pkgname=${_name}-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="A fast and powerful open source alternative to grep"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/svent/${_name}"
license=('GPL3')
options=('!strip' '!emptydirs')
makedepends=('help2man')
conflicts=("${_name}")
replaces=("${_name}")
provides=("${_name}=${pkgver}")
source_i686=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_i386.tar.gz")
source_x86_64=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_x86_64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_name}_${pkgver}_Linux_arm64.tar.gz")
sha256sums_i686=('1c72a26a74da20cb499d7a40ec0718e4f53f3f97620760c53f226a1dfe068fea')
sha256sums_x86_64=('8f100f6af90d54f66ae1c9cd45a39f2db39f98196b0f2db126ebb493d4cb3a7e')
sha256sums_aarch64=('b3a49c2380248b47c5d7b6e91600d199e1a97229fb7f5f849b534fb80f6e74e9')

[[ "$CARCH" = "i686" ]] && _arch='386'
[[ "$CARCH" = "x86_64" ]] && _arch='amd64'
[[ "$CARCH" = "aarch64" ]] && _arch='arm'

build() {
  cd "${srcdir}/"

  help2man ./${_name} --output "MAN-${pkgver}.1"
}

package() {
  cd "${srcdir}/"

  install -Dm 775 "${_name}" "${pkgdir}/usr/bin/${_name}"

  install -Dm 644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "MAN-${pkgver}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"
}
