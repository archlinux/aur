# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>

# toolchain build order: linux-api-headers->glibc->binutils->gcc->glibc->binutils->gcc

pkgname=linux-api-headers
pkgver=6.3
pkgrel=1
pkgdesc='Kernel headers sanitized for use in userspace'
arch=(any)
url='https://www.gnu.org/software/libc'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
sha256sums=('ba3491f5ed6bd270a370c440434e3d69085fcdd528922fa01e73d7657db73b1e'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd linux-$pkgver

  make mrproper
}

package() {
  cd linux-$pkgver
  make INSTALL_HDR_PATH="$pkgdir/usr" headers_install

  # use headers from libdrm
  rm -r "$pkgdir/usr/include/drm"
}
