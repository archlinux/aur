# Contributor: Alexander 'hatred' Drozdov <adrozdoff@gmail.com>
# Contributor: toha257 <toha257@gmail.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Tavian Barnes <tavianator@tavianator.com>
# Contributor: Logan Magee <mageelog@gmail.com>
# Maintainer: Wilken Gottwalt <wilken dot gottwalt at posteo dot net>

_target_arch=arm
_target=${_target_arch}-linux-gnueabihf
pkgname=${_target}-linux-api-headers
pkgver=6.6.8
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace"
arch=(any)
url='https://kernel.org/'
license=(GPL2)
makedepends=(rsync)
source=(https://kernel.org/pub/linux/kernel/v${pkgver:0:1}.x/linux-${pkgver}.tar.{xz,sign})
sha256sums=('5036c434e11e4b36d8da3f489851f7f829cf785fa7f7887468537a9ea4572416'
            'SKIP')
validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886'   # Linus Torvalds
              '647F28654894E3BD457199BE38DBBDC86092693E')  # Greg Kroah-Hartman

build() {
  cd linux-${pkgver}

  make ARCH="${_target_arch}" mrproper
  make ARCH="${_target_arch}" headers
}

package() {
  cd linux-${pkgver}

  make INSTALL_HDR_PATH="${pkgdir}"/usr/"${_target}" ARCH="${_target_arch}" headers_install
}
