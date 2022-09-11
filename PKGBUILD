# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target_arch=loongarch
_target=loongarch64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=5.19.0
_pkgdate=20220709
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
groups=(loongarch)
makedepends=('rsync')
source=("https://github.com/yetist/linux/releases/download/v${_pkgdate}/linux-${pkgver}-${_pkgdate}.tar.xz")
md5sums=('0e020a57877af14f8f793e53417394cd')

build() {
  cd "linux-$pkgver"

  make ARCH=$_target_arch mrproper
}

package() {
  cd "linux-$pkgver"

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=1 headers_install
}
