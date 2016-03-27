# Maintainer: Cody <aur AT codyps.com>

pkgname=pahole-git
pkgdesc="Various DWARF utils"
pkgver=v1.10.r28.g9df42c6
pkgrel=1
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=devel/pahole/pahole.git;a=summary"
license=('GPL2')
source=($pkgname'::git+https://kernel.googlesource.com/pub/scm/devel/pahole/pahole.git')
depends=('elfutils' 'python')
makedepends=('git' 'cmake')
provides=('dwarves' 'pahole')
conflicts=('dwarves' 'pahole')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  cmake -D CMAKE_INSTALL_PREFIX:PATH=/usr -D__LIB=lib .
  make
}

package() {
  cd "$pkgname"
  make DESTDIR=${pkgdir}/ install
}

# vim:set ts=2 sw=2 et:
