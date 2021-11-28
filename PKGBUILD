# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=go2tv
pkgver=1.9.0
pkgrel=1
pkgdesc='cast your videos to UPnP/DLNA MediaRenderer'
arch=('x86_64')
url="https://github.com/alexballas/${pkgname}"
license=('MIT')
depends=('libglvnd')
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")

build() {
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  cd $pkgname-$pkgver
  make build
}

package() {
  install -Dm755 $pkgname-$pkgver/build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 $pkgname-$pkgver/LICENSE        "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

sha256sums=('e364f31647a8a096a931c2bb570311af72dc59a4834a74978e1caf9be9d338ab')
