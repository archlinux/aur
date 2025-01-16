# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.44.4
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

sha256sums=('00060ddffa669bf67b468dc5fc1a583e96b95d8858b18fb9ee05b60209bdbf2a')
