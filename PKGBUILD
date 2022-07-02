# Contributor: dpayne <darby.payne@gmail.com>
# Maintainer: toitenminh <iam.minhnc@outlook.com>

pkgname="cli-visualizer-git"
pkgver=1.8+36+gb98068f
pkgrel=1
pkgdesc="A cli visualizer for mpd"
arch=('i686' 'x86_64')
url="https://github.com/dpayne/cli-visualizer"
license=('MIT')
depends=('ncurses' 'fftw')
makedepends=('git' 'fftw' 'cmake')
conflicts=('cli-visualizer' 'vis')
provides=(cli-visualizer)
options=(!buildflags)
install=${pkgname}.install
source=("${pkgname}"::"git+${url}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's#v##;s#-#+#g'
}

build() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build/
  cd build/
  cmake ../ && make clean && make -j$(nproc)
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 build/vis "$pkgdir"/usr/bin/vis
  install -Dm644 examples/basic_colors "$pkgdir"/usr/share/doc/"$provides"/basic_colors
  install -Dm644 examples/blue "$pkgdir"/usr/share/doc/"$provides"/blue
  install -Dm644 examples/config "$pkgdir"/usr/share/doc/"$provides"/config
  install -Dm644 examples/rainbow "$pkgdir"/usr/share/doc/"$provides"/rainbow
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$provides"/LICENSE
}
