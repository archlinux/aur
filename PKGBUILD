pkgname=dotctl
pkgver=0.1.0
pkgrel=1
pkgdesc="dotctl - simple dotfiles control utility"
arch=("x86_64")
url="https://github.com/xZepyx/dotctl"
license=("MIT")
depends=("python")
makedepends=("python-pipx" "patchelf")
source=("$pkgname-$pkgver.tar.gz::https://github.com/xZepyx/dotctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$srcdir/$pkgname-$pkgver/src"

    export PATH="$PATH:$HOME/.local/bin"

    pipx install nuitka || true

    nuitka \
        --onefile \
        --standalone \
        --assume-yes-for-downloads \
        dotctl.py
}

package() {
    cd "$srcdir/$pkgname-$pkgver/src"

    install -Dm755 dotctl.bin "$pkgdir/usr/bin/dotctl"
}
