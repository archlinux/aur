# Maintainer: James Wilcox <jameswilcox.98@gmail.com>
pkgname=taskmaster
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI personal task manager with pomodoro-inspired focus/break timers and todo list"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/jamesNWT/taskmaster"
license=('GPL-3.0-or-later')
depends=()
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::https://github.com/jamesNWT/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('91a39127dc4aabbda373213bb2c54b415b24c15227eb50e3856cda3a699df67a')

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
