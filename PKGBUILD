# Maintainer: Damjan Georgievski <gdamjan@gmail.com>
pkgname=go2tv
pkgver=1.7.1
pkgrel=1
pkgdesc='cast your videos to UPnP/DLNA MediaRenderer'
arch=('x86_64')
url="https://github.com/alexballas/Go2TV"
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
  install -Dm644 $pkgname-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/go2tv/LICENSE
}

sha256sums=('b47c58040cb835a93e0df2e03b64f90bfd83cd97aa5ff6380fe82bc0de38b930')
