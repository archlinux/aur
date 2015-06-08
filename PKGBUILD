# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target_arch=arm
_target=${_target_arch}-frc-linux-gnueabi
pkgname=${_target}-linux-api-headers
pkgver=3.8
_basever=3.8-r0
pkgrel=2
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL2')
groups=('frc-2015')
provides=("${_target}-linux-api-headers=${pkgver}"
  "${_target}-linux-api-headers30")
conflicts=("${_target}-linux-api-headers26")
options=('!emptydirs')
source=("http://download.ni.com/ni-linux-rt/feeds/2014/arm/armv7a-vfp-neon/linux-libc-headers-dev_${_basever}_armv7a-vfp-neon.ipk")
sha512sums=('9a4ac5d93854c08804007744fc576909cee92296028eddcc0389a8600da45f9946cdde1a841a6bd78e722f278c955e705995c7142165136cb544deeb7383b792')

package() {
  cd "${srcdir}"

  ar x linux-libc-headers-dev_${_basever}_armv7a-vfp-neon.ipk
  tar xf data.tar.gz
  
  cd usr
  mkdir -p ${pkgdir}/usr/${_target}/usr
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r ./* ${pkgdir}/usr/${_target}/usr
}
