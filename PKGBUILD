# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

_arch=aarch64
_kernel_arch=arm64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-linux-api-headers
pkgver=5.15.22
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace for $_kernel_arch"
arch=(any)
options=(!strip)
url='https://www.kernel.org'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('3544f960c4105d4d42e9bf6d2a0a1dd44a1928240a0ef45aa8e97c7b466463c3'
            'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


build() {
  cd linux-$pkgver

  make ARCH=$_kernel_arch mrproper
  make ARCH=$_kernel_arch headers_check
}

package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/sys-root/usr" ARCH=$_kernel_arch headers_install

}
