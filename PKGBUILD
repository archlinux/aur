# Maintainer: Xiaotian Wu <yetist@gmail.com>

_target_arch=loongarch
_target=loongarch64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=5.15.0.r1044054.g4d7f11bd5339
_pkgver=5.15.0
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
groups=(loongarch)
makedepends=('rsync')
source=('git+https://github.com/loongson/linux.git#branch=loongarch-next')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/linux"
	printf "${_pkgver}.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/linux"

    make ARCH=$_target_arch mrproper
}

package() {
    cd "$srcdir/linux"

    make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=1 headers_install
}
