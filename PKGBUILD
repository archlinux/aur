# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies
name=zeitgeist
pkgver=0.3.5
pkgrel=1
pkgdesc='The language-agnostic dependency checker'
arch=('x86_64')
url='https://github.com/kubernetes-sigs/zeitgeist'
license=('Apache')
makedepends=('go')
source=("$name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0c7d8c304b0fb8330902a97ba216e4e93a9a9920aeb7fe216043f0644ff03e36')
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
