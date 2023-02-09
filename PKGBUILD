# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pingu
pkgver=0.0.5
pkgrel=1
pkgdesc='ping command but with pingu'
url='https://github.com/sheepla/pingu'
license=('MIT')
arch=('x86_64' 'aarch64')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sheepla/pingu/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ee74f29267ec7ea117a65bdead66e7592a68dccb34fa3d2e195ed341116d613f')
b2sums=('63aa1be2deda5b2f07f6fb423a54cc79d045b87618b950b7f5032de38d3b30e5455896fc57186269d2806b0bb6dd22303555feb1f140a88274acf564b6b2c513')

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
