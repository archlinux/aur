# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gengetopt-git
pkgver=2.22.6.r0.g9d70a9b
pkgrel=1
pkgdesc="A tool to write command line option parsing code for C programs"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/gengetopt/"
license=('GPL3')
depends=('glibc')
makedepends=('git')
provides=('gengetopt')
conflicts=('gengetopt')
options=('!makeflags')
source=("git+https://git.savannah.gnu.org/git/gengetopt.git")
sha256sums=('SKIP')


pkgver() {
  cd "gengetopt"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g;s/^rel.//'
}

build() {
  cd "gengetopt"

  autoreconf -i
  ./configure --prefix="/usr"
  make
}

check() {
  cd "gengetopt"

  make check
}

package() {
  cd "gengetopt"

  make DESTDIR="$pkgdir" install
}
