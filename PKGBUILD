# Maintainer: Olivier Poitrey <rs@nextdns.io>
# Contributor: Guillaume Lefranc <guillaume@signal18.io>
pkgname=nextdns
pkgver=1.50.2
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

sha256sums=('46ab8b64c36bb1db8fe6cd3b6ded9fbbd2af7c3ab4960c01e566ff2969fe97ee')
