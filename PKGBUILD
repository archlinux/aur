# Maintainer: Nicholas Glazer <nicholasglazer at protonmail dot com>
pkgname=teru
pkgver=0.15.1
pkgrel=2
pkgdesc="AI-first terminal emulator, multiplexer, and tiling manager"
arch=('x86_64' 'aarch64')
url="https://teru.sh"
license=('MIT')
depends=('libxcb' 'libxkbcommon' 'wayland')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland')
makedepends=('zig>=0.17')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nicholasglazer/teru/archive/v$pkgver.tar.gz")
sha256sums=('ca37857d05f518b5b62194ac032bfe3a81224f085d4a7179cc2ce64daed2f040')

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
