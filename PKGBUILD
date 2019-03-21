# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=cpio-git
pkgver=2.12.r15.g068f5db
pkgrel=1
pkgdesc="Utility that copy files into or out of a cpio or tar archive"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/cpio/"
license=('GPL')
depends=('glibc')
makedepends=('git')
provides=('cpio')
conflicts=('cpio')
source=("git+https://git.savannah.gnu.org/git/cpio.git")
sha256sums=('SKIP')


pkgver() {
  cd "cpio"

  git describe --long --tags | sed 's/^release_//;s/\([^-]*-g\)/r\1/;s/-/./g;s/_/./g'
}

build() {
  cd "cpio"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "cpio"

  make check
}

package() {
  cd "cpio"

  make DESTDIR="$pkgdir" install

  rm -rf "$pkgdir/usr/libexec"
  rm -rf "$pkgdir/usr/share/man/man8"
}
