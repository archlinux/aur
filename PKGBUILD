# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=httperf-git
pkgver=r204.gde8cd6a
pkgrel=2
pkgdesc="The HTTP load generator"
arch=('i686' 'x86_64')
url="https://github.com/httperf/httperf"
license=('GPL-2.0-or-later')
depends=('openssl')
makedepends=('git')
provides=("httperf=$pkgver")
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
  ./configure \
    --prefix="/usr"
  make
}

package() {
  cd "httperf"

  make DESTDIR="$pkgdir" install
}
