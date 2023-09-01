# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=sed-git
pkgver=4.9.r32.g5420e97
pkgrel=1
pkgdesc="A non-interactive command-line text editor (stream editor)"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/sed/"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'rsync' 'wget')
provides=("sed=$pkgver")
conflicts=('sed')
source=("git+https://git.savannah.gnu.org/git/sed.git")
sha256sums=('SKIP')


pkgver() {
  cd "sed"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "sed"

  ./bootstrap
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "sed"

  #make check
}

package() {
  cd "sed"

  make DESTDIR="$pkgdir" install
}
