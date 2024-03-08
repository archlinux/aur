# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=acl-git
pkgver=2.3.2.r7.g714d74b
pkgrel=1
pkgdesc="Commands for manipulating POSIX access control lists"
arch=('i686' 'x86_64')
url="https://savannah.nongnu.org/projects/acl"
license=('GPL-2.0-or-later' 'LGPL-2.1-or-later')
depends=('glibc' 'attr')
makedepends=('git')
provides=("acl=$pkgver" 'xfsacl' 'libacl.so')
conflicts=('acl' 'xfsacl')
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
