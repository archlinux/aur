# Maintainer: Anatoly Bashmakov <anatoly at posteo.net>
# Contributor: 4679kun <4679kun at outlook.com>

_pkgname=httpstat
pkgname=$_pkgname-go
pkgver=1.1.0
pkgrel=1
pkgdesc="It's like curl -v, with colours."
arch=('x86_64')
url='https://github.com/davecheney/httpstat'
license=('MIT')
makedepends=('go')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/davecheney/httpstat/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('58260ab0a56557d0c2509ea09ee3fe54fe21a49f95d94189efdd64caec84fa67')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"
    mkdir -p build
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build/$_pkgname
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$_pkgname
}
