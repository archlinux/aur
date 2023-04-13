# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tar-git
pkgver=1.33.r106.g4177c98b
pkgrel=1
pkgdesc="Utility used to store, backup, and transport files"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/tar/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=("tar=$pkgver")
conflicts=('tar')
source=("git+https://git.savannah.gnu.org/git/tar.git")
sha256sums=('SKIP')


pkgver() {
  cd "tar"

  git describe --long --tags | sed 's/^release_//;s/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "tar"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "tar"

  make check
}

package() {
  cd "tar"

  make DESTDIR="$pkgdir" install
}
