# Maintainer: Boohbah <boohbah at gmail.com>
# Contributor: Christian Hesse <mail at eworm.de>

pkgname=f2fs-tools-git
_gitname=f2fs-tools
pkgver=1.1.0.38.g57baa23
pkgrel=1
pkgdesc="Tools for Flash-Friendly File System (F2FS)"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/f2fs-tools/"
license=('GPL')
makedepends=('git')
provides=('f2fs-tools')
conflicts=('f2fs-tools')
source=("git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's/v//; s/-/./g'
}

build() {
  cd $_gitname
  autoreconf -fi
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" sbindir=/usr/bin install
}

# vim:set ts=2 sw=2 et:
