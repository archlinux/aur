# Maintainer: jmattheis <contact AT jmattheis DOT de>
pkgname=shargo
pkgver=0.0.2
pkgrel=1
pkgdesc='A simple screensharing tool'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/jmattheis/shargo'
license=('GPL3')
depends=('libpng' 'libxtst' 'libglvnd' 'libxkbcommon-x11')
makedepends=('git' 'go')
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jmattheis/shargo/archive/v${pkgver}.tar.gz"
)
sha256sums=('e88d173de3fbd64098f382b7ae5f0dd33167400a54793725cfd6188623c613ca')

build() {
  cd "$pkgname-$pkgver"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o build main.go
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 build "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

