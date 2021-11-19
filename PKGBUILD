# Maintainer: Mattéo Delabre <aur.matteo@delab.re>
pkgname=rmapi
pkgver=0.0.18
pkgrel=1
pkgdesc='Access reMarkable tablet files through the Cloud API'
arch=('x86_64')
url='https://github.com/juruen/rmapi'
license=('AGPL3')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7f1d8782058be4b50d91f2ad3bd1bc88195728c1aec2697069e1e684a7e52827')

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    go build -o build .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
