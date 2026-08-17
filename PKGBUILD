# Maintainer: Pavle Portic <archlinux@theedgeofrage.com>

pkgname=zeitgeist-dependencies
_name=zeitgeist
pkgver=0.8.0
pkgrel=1
pkgdesc="The language-agnostic dependency checker"
arch=("x86_64")
url="https://github.com/kubernetes-sigs/zeitgeist"
license=("Apache")
makedepends=("go")
source=("$_name-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=("2b6de736570c6c04f1fe569cfcbe886290f3d15567ab58f8f9d3681689603d3a")
options=(!lto)

build() {
    cd "$_name-$pkgver"/remote/zeitgeist
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    CGO_ENABLED=0 go build -ldflags "-X main.version=$pkgver -X main.prerelease="
}

package() {
    cd "$_name-$pkgver"/remote/zeitgeist
    install -Dm755 "$_name" "$pkgdir"/usr/bin/"$_name"
}
