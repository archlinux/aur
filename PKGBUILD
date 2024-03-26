#!/hint/bash -e
# Maintainer: Adrien Smith <adrien@panissupraomnia.dev>

pkgname=overmind
pkgver=2.5.1
pkgrel=1
pkgdesc="Process manager for Procfile-based applications and tmux"
arch=("x86_64")
url="https://github.com/DarthSim/$pkgname"
license=("MIT")
depends=('glibc' 'tmux')
makedepends=("go")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d616b89465d488878ed2e1f79e66f8af5b5c2f1d3cf75c2b08e04fb04752d187')
b2sums=('da49f9b8764f80ec55b4d4af7376615a165e058078194c9befe08e5afe5c3e81f315f339166caad009fcc0aa1f335fb58c0025d833bd4034398dbb1396890330')

build() {
  cd "$pkgname-$pkgver"

  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o $pkgname .
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
