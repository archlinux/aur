# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=bison-git
pkgver=3.0.4.r16.gd6445ec1
pkgrel=2
pkgdesc="The GNU general-purpose parser generator"
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/bison/bison.html"
license=('GPL3')
depends=('glibc')
makedepends=('git' 'gzip' 'rsync' 'tar')
provides=('bison')
conflicts=('bison')
source=("git+https://git.savannah.gnu.org/git/bison.git"
        "sun-cc.patch")
sha256sums=('SKIP'
            'ecde4c4e21e16d4b2a0bf6fc22ada353cc7e6977af340de967fa35387ce921e1')


prepare() {
  cd "bison"

  patch -p1 -i "$srcdir/sun-cc.patch"
  git submodule update --init "submodules/autoconf"
}

pkgver() {
  cd "bison"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "bison"

  ./bootstrap
  ./configure --prefix="/usr"
  make
}

check() {
  cd "bison"

  make check
}

package() {
  cd "bison"

  make DESTDIR="$pkgdir" install
}
