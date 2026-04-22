# Maintainer: James Wilcox <jameswilcox.98@gmail.com>
pkgname=taskmaster
pkgver=0.2.0
pkgrel=1
pkgdesc="A TUI personal task manager with pomodoro-inspired focus/break timers and todo list"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/jamesNWT/taskmaster"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamesNWT/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('dad42410f2ec0a4ed602297d5a6f539e35051bfd321b6c0543a1683d8c078b40')

build() {
    cd "$pkgname-$pkgver"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
    go build -o $pkgname .
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
