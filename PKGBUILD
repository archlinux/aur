# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: dpayne <darby.payne@gmail.com>

pkgname="cli-visualizer-git"
pkgver=1
pkgrel=1
epoch=1
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'pkg-config' 'cmake')
conflicts=()
provides=(cli-visualizer)
install=${pkgname}.install
source=("git+https://github.com/dpayne/cli-visualizer")
md5sums=('SKIP')

pkgver() {
  cd cli-visualizer || exit
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd cli-visualizer || exit
  make
}

package() {
  cd cli-visualizer || exit
  install -Dm755 build/vis "$pkgdir/usr/bin/vis"
  install -Dm644 examples/blue "$pkgdir"/usr/share/doc/"$pkgname"/blue
  install -Dm644 examples/config "$pkgdir"/usr/share/doc/"$pkgname"/config
  install -Dm644 examples/rainbow "$pkgdir"/usr/share/doc/"$pkgname"/rainbow
  install -Dm644 examples/basic_colors "$pkgdir"/usr/share/doc/"$pkgname"/basic_colors
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
