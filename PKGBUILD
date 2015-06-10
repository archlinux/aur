# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Torjus Haakestad <torjuspuz@gmail.com>

pkgname=libhubbub-git
pkgver=20120904
pkgrel=1
pkgdesc='HTML5 compliant parsing library'
arch=('x86_64' 'i686')
url='http://www.netsurf-browser.org/projects/hubbub/'
license=('MIT')
depends=('libparserutils')
makedepends=('git' 'netsurf-buildsystem')
provides=('hubbub' 'libhubbub')
replaces=('hubbub-svn')
conflicts=('hubbub')
source=('git://git.netsurf-browser.org/libhubbub.git')
md5sums=('SKIP')

prepare() {
  sed -i 's:-Werror::' libhubbub/Makefile
}

build() {
  make -C libhubbub LIBDIR=lib PREFIX=/usr COMPONENT_TYPE='lib-shared'
}

package() {
  make -C libhubbub install LIBDIR=lib PREFIX=/usr DESTDIR="$pkgdir" COMPONENT_TYPE='lib-shared'   
  install -Dm644 libhubbub/COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
