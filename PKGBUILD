# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies
name=zeitgeist
pkgver=0.4.3
pkgrel=1
pkgdesc='The language-agnostic dependency checker'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/zeitgeist'
license=('Apache')
makedepends=('go')
source=("$name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('46523516bd287daa371cc567a3db11a88e45c2f3b10ac73c816ceca1f3061d0d')
options=(!lto)

build() {
    cd "$name-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver -X main.prerelease="
}

package() {
    cd "$name-$pkgver"
    install -Dm755 "$name" "$pkgdir"/usr/bin/"$name"
}
