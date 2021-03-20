# Maintainer: Tharre <tharre3@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=age
_pkgver=1.0.0-rc.1
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc='A simple, modern and secure file encryption tool'
arch=('x86_64')
url="https://github.com/FiloSottile/$pkgname"
license=('BSD')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz")
sha256sums=('2ef0839b0e2e79435c037662c67df675b4ebc50d7bf001079d24b0bdf1d0c098')

build() {
    cd "$pkgname-$_pkgver"
    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "-extldflags \"$LDFLAGS\"" \
      -o . ./...
}

check() {
    cd "$pkgname-$_pkgver"
    go test ./...
}

package() {
    cd "$pkgname-$_pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" age age-keygen
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
