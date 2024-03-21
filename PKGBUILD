# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="teler"
pkgver=2.0.0
pkgrel=1
pkgdesc="Real-time HTTP Intrusion Detection"
arch=("x86_64" "armv6h" "armv7h" "aarch64")
url="https://teler.app/"
license=("Apache-2.0")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/kitabisa/teler/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('d607dce8f618d0120239cd1f491988239f60e6671beb589d0266ed2d0fb921fc4c04018cbb09451f62bdb0c48e7f9db792d431457127d55a539b810192a77702')
options=("!strip")
backup=("etc/$pkgname/teler.yaml")

build(){
 cd "$pkgname-$pkgver"
 export CGO_CPPFLAGS="${CPPFLAGS}"
 export CGO_CFLAGS="${CFLAGS}"
 export CGO_CXXFLAGS="${CXXFLAGS}"
 export CGO_LDFLAGS="${LDFLAGS}"
 export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
 go build -o teler .
}

package(){
 cd "$pkgname-$pkgver"
 install -D -m 755 "$pkgname" -t "$pkgdir/usr/bin"
 install -D -m 644 "teler.example.yaml" "$pkgdir/etc/$pkgname/teler.yaml"
 install -D -m 644 "teler.fail2ban-jail.example.conf" -t "$pkgdir/usr/share/$pkgname"
 install -D -m 644 "teler.fail2ban-filter.example.conf" -t "$pkgdir/usr/share/$pkgname"
}
