# Maintainer: Javier Tiá <javier dot tia at gmail dot com>
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_name=sift
pkgname=${_name}-bin
pkgver=0.9.2
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
sha256sums_i686=('759f33e4f3b162dc5fcf5bc6ee95dc83fd29ca39f592381b00daf395dc87ee89')
sha256sums_x86_64=('909596d8445ec840e3451c4e09052c74c26ae9b8503b1fb095033c0521efd29f')
sha256sums_aarch64=('11a2341abeaa67d78c9ecfce37293e01e32ae6c757f9b200ea051c27f09ed436')

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
