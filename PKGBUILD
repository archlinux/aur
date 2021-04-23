# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Maintainer: Logan Magee <mageelog@gmail.com>

_target_arch=arm
_target=${_target_arch}-linux-gnueabihf
pkgname=${_target}-linux-api-headers
pkgver=5.11.16
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url='https://www.gnu.org/software/libc'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
b2sums=('fe7a296697d21ac4572b6714da898bc9303cf04f988297329e10d660a957ea6142a182fe583e7a98bf2f767f61989288454ecf640844346af079d90b4fdd21b1'
        'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd linux-$pkgver

  make ARCH=$_target_arch mrproper
  make ARCH=$_target_arch headers_check
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr/$_target" ARCH=$_target_arch headers_install

  # use headers from libdrm
  rm -rf "$pkgdir/usr/$_target/include/drm"
}
