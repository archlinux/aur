# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Arlo Siemsen <arkixml@gmail.com>
pkgname=gridmgr-git
pkgver=r32.d30b31c
pkgrel=1
pkgdesc="command line tool which provides keyboard-bindable commands for easy window manipulation."
arch=('i686' 'x86_64')
url="http://nickbp.com/gridmgr/"
license=('GPL-3.0-or-later')
depends=('libxinerama' 'gcc-libs' 'libx11' 'glibc')
provides=('gridmgr')
conflicts=('gridmgr')
makedepends=('git' 'cmake')
source=("$pkgname::git+https://git.sr.ht/~nickbp/gridmgr")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $pkgname
  LDFLAGS+=' -Wl,-z,shstk'
  cmake src
  make
}

package() {
  cd $pkgname
  install -Dm755 gridmgr "${pkgdir}/usr/bin/gridmgr"
}

# vim:set ts=2 sw=2 et:
