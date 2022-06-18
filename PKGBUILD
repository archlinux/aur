# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pingu
pkgver=0.0.3
pkgrel=1
pkgdesc='ping command but with pingu'
url='https://github.com/sheepla/pingu'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sheepla/pingu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9803c812f8d9433758f2d5e5b21686b6d87f37f9418065ce5b272ab9cfc0948b')
b2sums=('42d91b22233fe92c589f05216b3aa9d1da1a8d26ec17402f1959d07a1e0d97bcb5f36fad47184043cebfc999a2faabcd2fbe572ef4ff10c195d247cb825e1141')

build() {
  cd "pingu-$pkgver"

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"

  go build -v -o pingu .
}

package() {
  cd "pingu-$pkgver"

  install -Dm0755 pingu "$pkgdir/usr/bin/pingu"

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
