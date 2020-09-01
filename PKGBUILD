# Maintainer:  Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->binutils->glibc

pkgname=linux-api-headers
pkgver=5.8
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(any)
url='https://www.gnu.org/software/libc'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
md5sums=('0e5c4c15266218ef26c50fac0016095b'
         'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd linux-$pkgver

  make mrproper
  make headers_check
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr" headers_install

  # use headers from libdrm
  rm -r "$pkgdir/usr/include/drm"
}
