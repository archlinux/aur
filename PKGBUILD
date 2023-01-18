# Maintainer: Mattéo Delabre <aur.matteo@delab.re>
pkgname=mercator
pkgver=0.2.0
pkgrel=1
pkgdesc='a TUI openstreetmap explorer'
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/mrusme/mercator'
license=('GPL3')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a25fd70c90b3a9cb5ba08e6e8b008ff1c86dff61cb8b32c3e218546e6dec3f9c') # not upstream

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
