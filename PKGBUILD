# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=weather-go
pkgver=0.15.1
pkgrel=1
pkgdesc='Weather via the command line'
url=https://github.com/genuinetools/weather
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('go-pie')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('447e36407dffc194a9663b62fff273aaf78daa6641c951b97d0320dff4892e93a4a3052cab13d4277b8ce23cfbd899493ceadef09e078ebd1eb3f8fddb68ab64')

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
