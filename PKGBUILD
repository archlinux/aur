# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: Gamesmes90 <gamesmes90@gmail.com>

pkgname="cli-visualizer-git"
pkgver=1.8+36+gb98068f
pkgrel=1
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="http://web.archive.org/web/20241004213645/https://github.com/dpayne/cli-visualizer"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'cmake')
conflicts=('cli-visualizer' 'vis')
provides=(cli-visualizer)
options=(!buildflags)
install=${pkgname}.install
source=("cli-visualizer-git::https://web.archive.org/web/20220627182126if_/https://codeload.github.com/dpayne/cli-visualizer/zip/refs/heads/master")
md5sums=('SKIP')

build() {
  cd "${srcdir}/cli-visualizer-master"
  mkdir -p build/
  cd build/
  cmake ../ && make clean && make -j$(nproc)
}

package() {
  cd "${srcdir}/cli-visualizer-master"
  install -Dm755 build/vis "$pkgdir"/usr/bin/vis
  install -Dm644 examples/basic_colors "$pkgdir"/usr/share/doc/"$provides"/basic_colors
  install -Dm644 examples/blue "$pkgdir"/usr/share/doc/"$provides"/blue
  install -Dm644 examples/config "$pkgdir"/usr/share/doc/"$provides"/config
  install -Dm644 examples/rainbow "$pkgdir"/usr/share/doc/"$provides"/rainbow
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$provides"/LICENSE
}
