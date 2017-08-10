# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Updated for MIPS64: Valentín Kivachuk <vk18496@gmail.com>

_target_arch=mips
_target=mips64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=4.11
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='http://www.kernel.org'
license=(GPL2)
source=(http://www.kernel.org/pub/linux/kernel/v4.x/linux-$pkgver.tar.xz)
sha1sums=('0d2594b7aa3e79521f229569f9e14dc56bdcbd78')

build() {
  cd linux-$pkgver

  make ARCH=$_target_arch mrproper
  make ARCH=$_target_arch headers_check
}

package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install

  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -or -name ..install.cmd \) -delete
}
