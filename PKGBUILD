# Maintainer: Jaap Aarts <jaap.aarts1@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=riscv
_target=riscv64-linux-uclibc
pkgname=$_target-linux-api-headers
pkgver=6.10
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
makedepends=('rsync')
source=(https://www.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.{xz,sign})
sha512sums=('baa2487954044f991d2ae254d77d14a1f0185dd62c9f0fcaff69f586c9f906823017b8db1c4588f27b076dfa3ebb606929fec859f60ea419e7974330b9289cc2'
            'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


build() {
  cd linux-$pkgver

  make ARCH=$_target_arch mrproper
}

package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install
}
