# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.47.3
pkgrel=1
pkgdesc='NextDNS DNS/53 to DoH Proxy'
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url='https://github.com/nextdns/nextdns'
license=('MIT')
makedepends=('go')
install="$pkgname.install"
source=("$url/archive/v$pkgver.tar.gz")
options=(!lto)

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    go build -buildmode=pie -trimpath -ldflags="-linkmode=external -X main.version=$pkgver" -mod=readonly -modcacherw -o ${pkgname} .
}

package() {
    cd $pkgname-$pkgver
    install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

sha256sums=('73a57ff41074d32a7707b751da36c0a618edc6d2b41ddf61ca565222448f567b')
