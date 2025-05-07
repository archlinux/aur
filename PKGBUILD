pkgname=salahtime-go
pkgver=1.0.3
pkgrel=1
url="https://codeberg.org/unixdigest/salahtime-go"
pkgdesc="A small command line application written in Go that displays the Islamic prayer times for Europe/Copenhagen"
arch=('any')
license=('CC BY 4.0')
depends=(
  'pacman>=5.1'
  'sudo'
  'git'
)
makedepends=(
  'go'
)

source=("https://codeberg.org/unixdigest/salahtime-go/archive/v1.0.3.zip")
md5sums=('ab6ebd237206ab5479a569c8edc319a9')

build() {
  cd $pkgname
  go build \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-extldflags $LDFLAGS" \
    -o $pkgname .
}

package() {
  cd $pkgname
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
