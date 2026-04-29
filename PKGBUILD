# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target_arch=loongarch
_target=loongarch64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=6.19
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL-2.0-only)
groups=(loongarch)
makedepends=('rsync')
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.xz)
sha256sums=('303079a8250b8f381f82b03f90463d12ac98d4f6b149b761ea75af1323521357')

build() {
  cd "linux-$pkgver"

  make ARCH=$_target_arch mrproper
}

package() {
  cd "linux-$pkgver"

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install
}
