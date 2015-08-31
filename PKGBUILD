# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=arm64
_target=aarch64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=4.2
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='http://www.gnu.org/software/libc'
license=(GPL2)
source=(http://www.kernel.org/pub/linux/kernel/v4.x/linux-$pkgver.tar.xz)
sha1sums=('5e65d0dc94298527726fcd7458b6126e60fb2a8a')

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
