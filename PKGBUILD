# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=acl-git
pkgver=2.2.53.r4.g40c190d
pkgrel=1
pkgdesc="Commands for manipulating POSIX access control lists"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/acl"
license=('GPL' 'LGPL')
depends=('glibc' 'attr')
makedepends=('git')
provides=('acl' 'xfsacl' 'libacl.so')
conflicts=('acl' 'xfsacl')
replaces=('xfsacl')
options=('staticlibs')
source=("git+https://git.savannah.gnu.org/git/acl.git")
sha256sums=('SKIP')


pkgver() {
  cd "acl"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "acl"

  ./autogen.sh
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "acl"

  make check
}

package() {
  cd "acl"

  make DESTDIR="$pkgdir" install
}
