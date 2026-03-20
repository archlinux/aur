# Maintainer: lostf1sh <lostf1sh@users.noreply.github.com>
pkgname=pomo-cli
pkgver=1.2.0
pkgrel=1
pkgdesc="Terminal-based pomodoro timer with TUI, session tracking, and statistics"
arch=('x86_64')
url="https://github.com/lostf1sh/pomo"
license=('MIT')
depends=('glibc')
makedepends=('go')
provides=('pomo')
conflicts=('pomo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('89edd6ded2e990238c828c3001dbd6ead4203670c29d8e1a66cdbf5744be25b8')

build() {
    cd "pomo-$pkgver"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    export GOPATH="$srcdir/gopath"
    go build -o pomo -ldflags "-linkmode=external -X main.version=$pkgver" .
}

package() {
    cd "pomo-$pkgver"
    install -Dm755 pomo "$pkgdir/usr/bin/pomo"
}
