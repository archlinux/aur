# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies
_name=zeitgeist
pkgver=0.5.4
pkgrel=1
pkgdesc="The language-agnostic dependency checker"
arch=("x86_64")
url="https://github.com/kubernetes-sigs/zeitgeist"
license=("Apache")
makedepends=("go")
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("a847254d39ac28e9d2a85cdac1d9fec86af7181211f8b00cd5b3b4a7d5fb15f4")
options=(!lto)

build() {
    echo $_name
    cd "$_name-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -ldflags "-X main.version=$pkgver -X main.prerelease="
}

package() {
    cd "$_name-$pkgver"
    install -Dm755 "$_name" "$pkgdir"/usr/bin/"$_name"
}
