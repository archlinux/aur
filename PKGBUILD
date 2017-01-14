# $Id: PKGBUILD 90527 2013-05-13 00:21:47Z seblu $
# Maintainer: Sébastien Luttringer
# Contributor: Jonathan Liu <net147@gmail.com>
# Contributor: Judd Vinet <jvinet@zeroflux.org>

pkgname=makedev
pkgver=3.23_1
pkgrel=2
pkgdesc='The ubiquitous script to create static device nodes'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://people.redhat.com/nalin/MAKEDEV/'
source=("http://people.redhat.com/nalin/MAKEDEV/MAKEDEV-${pkgver//_/-}.tar.gz")
md5sums=('554faf6cbc9a84e4bd58ccfa32d74e2f')

build() {
  cd ${pkgname^^*}-${pkgver/_*}
  make
}

package() {
  cd ${pkgname^^*}-${pkgver/_*}
  # We make devdir == makedevdir to avoid install script to symlink into /dev
  # As previous make doesn't have a bad devdir, everything goes well
  make DESTDIR="$pkgdir" devdir=/usr/bin makedevdir=/usr/bin sbindir=/usr/bin install
}

# vim:set ts=2 sw=2 et:
