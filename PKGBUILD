# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=socat-git
pkgver=1.7.4.4.r0.ga8b2cb6
pkgrel=1
pkgdesc="Multipurpose relay"
arch=('i686' 'x86_64')
url="http://www.dest-unreach.org/socat/"
license=('GPL2')
depends=('glibc' 'openssl' 'readline')
makedepends=('git' 'yodl')
provides=("socat=$pkgver")
conflicts=('socat')
source=("git+https://repo.or.cz/socat.git")
sha256sums=('SKIP')


pkgver() {
  cd "socat"

  git describe --long --tags | sed 's/^tag-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "socat"

  autoconf -f
  ./configure \
    --prefix="/usr"
  make
}

check() {
  cd "socat"

  #make test
}

package() {
  cd "socat"

  make DESTDIR="$pkgdir" install
}
