# Maintainer:  Ellery Tsai <elleryq@gmail.com>

pkgname=sockperf-git
pkgver=3.8.r328.31ee322
pkgrel=1
pkgdesc='A benchmarking utility for measuring network performance (latency and throughput) over socket API, with focus on high performance systems'
url='https://github.com/mellanox/sockperf'
license=('custom') # BSD-3
arch=('i686' 'x86_64')
source=('repo::git+https://github.com/Mellanox/sockperf.git#branch=sockperf_v2')
md5sums=('SKIP')
depends=('bash' 'gawk')
makedepends=('doxygen' 'git')
pkgver() {
  cd repo
  printf "3.8.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  cd repo
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd repo
  # dirty hack, just forgive the bad 'make install'
  make DESTDIR="$pkgdir" install || true
}

# vim:set ts=2 sw=2 et:
