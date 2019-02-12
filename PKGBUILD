# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=httperf-git
pkgver=r194.g00bf5da
pkgrel=1
pkgdesc="The HTTP load generator"
arch=('i686' 'x86_64')
url="https://github.com/httperf/httperf"
license=('GPL')
depends=('openssl')
makedepends=('git')
provides=('httperf')
conflicts=('httperf')
source=("git+https://github.com/httperf/httperf.git")
sha256sums=('SKIP')


pkgver() {
  cd "httperf"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "httperf"

  autoreconf -fi
  ./configure --prefix="/usr"
  make
}

package() {
  cd "httperf"

  make DESTDIR="$pkgdir" install
}
