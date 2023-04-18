# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_target_arch=powerpc
_target=powerpc64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=6.1
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace ($_target)"
arch=(any)
url='https://www.kernel.org'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('2ca1f17051a430f6fed1196e4952717507171acfd97d96577212502703b25deb'
            'SKIP')
validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install

  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -or -name ..install.cmd \) -delete
}
