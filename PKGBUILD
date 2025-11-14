#Maintainer: Popolon <popolon aL popolon d.t org>
pkgname=c2clat-git
_pkgname=c2clat
pkgver=r12.5419682
pkgrel=1
pkgdesc="A tool to measure CPU core to core latency"
arch=("$CARCH")
url="https://github.com/rigtorp/c2clat"
license=('MIT')
depends=()
makedepends=('git' 'gcc')
optdepends=('gnuplot: Draw graphs from output')
source=("git+https://github.com/rigtorp/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${_pkgname}"
  g++ -O3 -DNDEBUG c2clat.cpp -o c2clat -pthread
}

package() {
  cd "${_pkgname}/"
  install -Dm755 c2clat  "$pkgdir/usr/bin/c2clat"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
