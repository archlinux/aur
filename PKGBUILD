# Maintainer: YaNing Lu <dluyaning@gmail.com>

pkgname=wlhax
pkgver=0.0.1.20240318
pkgrel=1
pkgdesc="Wayland proxy that monitors and displays various application state in a TUI"
arch=('x86_64')
url="https://git.sr.ht/~kennylevinsen/wlhax"
license=('MIT')
depends=('wayland')
makedepends=('go' 'git')
_commit=10b42941847f11a43dceaf8bf449301056c71f3b  # 使用最新的 commit hash
source=("git+https://git.sr.ht/~kennylevinsen/wlhax#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
    cd "$pkgname"
}

build() {
    cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o wlhax
}

package() {
    cd "$pkgname"
    install -Dm755 wlhax "$pkgdir/usr/bin/wlhax"

    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
