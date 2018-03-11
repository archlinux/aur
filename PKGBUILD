# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.15.0
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/genuinetools/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('38166350722032f487c643174806ba5d17a091f436c6e084ca5cb7a5f2f32973a786e4bc32ec42063d79ee6153dee3d8ef5dad5b64286c1d0028c3286b80af8a')

prepare() {
  mkdir -p src/github.com/genuinetools
  ln -rsnf weather-$pkgver src/${url#*//}
}

build() {
  cd src/${url#*//}
  export GOPATH="$srcdir"
  go build -v
}

package() {
  cd weather-$pkgver
  install -Dm755 weather "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
