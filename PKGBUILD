# Maintainer: Nicholas Glazer <nicholasglazer at protonmail dot com>
pkgname=teru
pkgver=0.14.7
pkgrel=1
pkgdesc="AI-first terminal emulator, multiplexer, and tiling manager"
arch=('x86_64' 'aarch64')
url="https://teru.sh"
license=('MIT')
depends=('libxcb' 'libxkbcommon' 'wayland')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland')
makedepends=('zig>=0.17')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nicholasglazer/teru/archive/v$pkgver.tar.gz")
sha256sums=('f9ad436bb24c5fff142a3becabed32c447d22f9ebfd8425de7f67bc30575c475')

build() {
    cd "$pkgname-$pkgver"
    zig build -Doptimize=ReleaseSafe
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 zig-out/bin/teru "$pkgdir/usr/bin/teru"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Desktop entry
    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/teru.desktop" << EOF
[Desktop Entry]
Name=teru
Comment=AI-first terminal emulator
Exec=teru
Icon=utilities-terminal
Terminal=false
Type=Application
Categories=System;TerminalEmulator;
Keywords=terminal;multiplexer;ai;zig;
EOF
}
