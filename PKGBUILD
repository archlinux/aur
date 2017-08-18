# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target_arch=arm
_target=${_target_arch}-frc-linux-gnueabi
pkgname=${_target}-linux-api-headers
pkgver=3.19
_basever=3.19-r0.36
pkgrel=2
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL2')
groups=('frc-toolchain')
provides=("${_target}-linux-api-headers=${pkgver}"
  "${_target}-linux-api-headers30")
conflicts=("${_target}-linux-api-headers26")
options=('!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2016/arm/ipk/cortexa9-vfpv3/linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk")
sha512sums=('038f4922e3c05d4882292fc8437266debda5860e79f119f4ec73f0aa2814011cd187dc6505e79693ba15b6d0eabfbbe5c2f0263c60654dbd5a93e8763c4b75cc')

package() {
  cd "${srcdir}"

  ar x linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk
  tar xf data.tar.gz
  
  cd usr
  mkdir -p ${pkgdir}/usr/${_target}/usr
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r ./* ${pkgdir}/usr/${_target}/usr
}
