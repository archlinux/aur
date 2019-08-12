# Maintainer: Wu Xiaotian <yetist@gmail.com>

_target_arch=mips
_target=mips64el-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=5.2.6
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='http://www.kernel.org'
license=(GPL2)
source=(http://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.xz)
sha1sums=('b07b8b7997a7211c25f5b51341890d4f2c349646')

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
