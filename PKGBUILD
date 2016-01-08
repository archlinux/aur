# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target_arch=arm
_target=${_target_arch}-frc-linux-gnueabi
pkgname=${_target}-linux-api-headers
pkgver=3.16
_basever=3.16-r0.40
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL2')
groups=('frc-2016')
provides=("${_target}-linux-api-headers=${pkgver}"
  "${_target}-linux-api-headers30")
conflicts=("${_target}-linux-api-headers26")
options=('!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2015/arm/ipk/cortexa9-vfpv3/linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk")
sha512sums=('992fa73327fbf540e0ce743ec7f44c88388de07ecc7641c40af7a997a3a7c374732ede98bdcdd4bc72c184067a51a56993dbf13842dd10ef3681f54e9c46f0b3')

package() {
  cd "${srcdir}"

  ar x linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk
  tar xf data.tar.gz
  
  cd usr
  mkdir -p ${pkgdir}/usr/${_target}/usr
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r ./* ${pkgdir}/usr/${_target}/usr
}
