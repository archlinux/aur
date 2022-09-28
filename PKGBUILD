# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies
name=zeitgeist
pkgver=0.3.2
pkgrel=1
pkgdesc='The language-agnostic dependency checker'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/zeitgeist'
license=('Apache')
makedepends=('go')
source=("$name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d981a10f398bd7fb736231ff3bf71fd3b6f91eb937e53393f7665b457ba9cad')
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
