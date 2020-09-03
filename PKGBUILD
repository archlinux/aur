# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=riscv
_target=riscv64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=5.8
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
makedepends=('rsync')
source=(https://www.kernel.org/pub/linux/kernel/v5.x/linux-$pkgver.tar.{xz,sign})
sha512sums=('45a53ecf351096ef6e98242cca4228b8da9b9139ecc6963695791ea6fb7a9484a4e1c19dcca7ce7cbfdfa49de0451b70973bb078f12bdae9cbaddbc3f8092556'
            'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


build() {
  cd linux-$pkgver

  make ARCH=$_target_arch mrproper
  make ARCH=$_target_arch headers_check
}

package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install
}
