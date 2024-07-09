# Maintainer: Eric Torres <eric.torres@its-et.me>
pkgname=traefik-certificate-manager
pkgver=0.0.1
pkgrel=2
pkgdesc="A command-line tool for managing Traefik's acme.json configuration file"
arch=('x86_64' 'aarch64')
url="https://github.com/CastawayEGR/traefik-certificate-manager"
license=('MIT')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/CastawayEGR/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ac81c5e2868d55964d5a3938d7ffc6f56929a15149975dba658eb4400fc30f04')

build(){
	cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -ldflags "-compressdwarf=false -linkmode external" -o tcm .
}

package() {
	cd "$pkgname-$pkgver"

    install -Dm755 tcm "$pkgdir"/usr/bin/tcm
    install -Dm755 LICENSE "$pkgdir"/usr/share/licenses/traefik-certificate-manager/LICENSE
}
