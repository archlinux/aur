# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="ascii-image-converter"
pkgname="${_pkgname}-bin"
pkgver=1.13.1
pkgrel=2
pkgdesc="Convert images into ASCII art and print them out to the console"
arch=('aarch64' 'armv7h' 'i686' 'x86_64')
url="https://github.com/TheZoraiz/${_pkgname}"
license=('Apache-2.0')
depends=('glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_arm64_64bit.tar.gz")
source_armv7h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_armv6_32bit.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_i386_32bit.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_Linux_amd64_64bit.tar.gz")
sha256sums_aarch64=('7b50c9ff641fb8f10e330aa7c4ce047feb6ac0ba3ceaa7df5674e1974439fd71')
sha256sums_armv7h=('b374ef0c2a22a402fc79036c6ae842742b69adddd7f031f5321ae224b0aa9d56')
sha256sums_i686=('3e9e2f92781f8bac27d3b75813f422f48bf898322836c5219ae1bb00ab46709f')
sha256sums_x86_64=('5652d8b7ba9efa71837c473d32d223a8a77264bc6e003ae311719a8644df3c56')

case "${CARCH}" in
  x86_64)
    _arch="amd64_64bit"
    ;;
  i686)
    _arch="i386_32bit"
    ;;
   aarch64)
    _arch="arm64_64bit"
    ;;
  armv7h)
    _arch="armv6_32bit"
    ;;
  *)
    echo "Unsupported architecture: ${CARCH}"
    ;;
esac

package() {
  cd "${srcdir}/${_pkgname}_Linux_${_arch}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.txt" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
