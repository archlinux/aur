# Maintainer: Nikitathechick <christine.lily.morris@proton.me>
pkgname=daemonwayans
pkgver=1.0.0
pkgrel=1
pkgdesc="A lightweight daemon that monitors AUR uptime"
arch=("x86_64")
url="https://github.com/ChristineLily/daemonwayans"
license=('MIT')
makedepends=('git' 'go')
source=("git+$url.git")
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
        go build
}

check() {
        cd "$pkgname"
        go test ./...
}

package() {
        cd "$pkgname"
        install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}
