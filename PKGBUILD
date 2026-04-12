# Maintainer: Shellwen <i@shellwen.com>
pkgname=chromium-dark-mode-workaround
pkgver=0.0.3
pkgrel=1
pkgdesc='Workaround for Chromium/Electron stuck in dark mode after Dark-to-Light theme switch on Linux'
arch=('x86_64' 'aarch64')
url='https://github.com/shellwen/chromium-dark-mode-workaround'
license=('Apache-2.0')
depends=('dbus' 'glib2')
makedepends=('go' 'git')
install=chromium-dark-mode-workaround.install
source=("git+https://github.com/shellwen/chromium-dark-mode-workaround.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    export CGO_ENABLED=0
    go build -trimpath -ldflags="-s -w" -o "$pkgname" .
}

package() {
    cd "$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 aur/chromium-dark-mode-workaround.service "$pkgdir/usr/lib/systemd/user/$pkgname.service"
}
