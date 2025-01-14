# Maintainer: Hadi Chokr <hadichokr@icloud.com>
pkgname=arch-update-helper
pkgver=2.0.0
pkgrel=1
pkgdesc="A Systray Utility for Checking Arch Linux Updates and Installing Them"
arch=('x86_64')
url="https://github.com/silverhadch/arch-update-helper"
license=('GPL-3.0-or-later')  # Corrected license string
depends=('qt6-base')          # Add runtime dependencies here
makedepends=('git' 'cmake')   # Dependencies needed at build time
source=("git+${url}.git#tag=v.2.0.0")  # Reference to specific tag
sha256sums=('SKIP')

build() {
    cd "$srcdir/arch-update-helper"

    # Create the build directory and build the binary
    mkdir -p build
    cmake -Bbuild -H.
    cmake --build build
}

package() {
    cd "$srcdir/arch-update-helper"

    # Install the binary
    install -Dm755 "build/Arch-Update-Helper" "$pkgdir/usr/bin/Arch-Update-Helper"

    # Install the Man Page 
    install -Dm 644 "man/arch-update-helper.1.gz" "$pkgdir/usr/share/man/man1/arch-update-helper.1.gz"
    
    # Install the .desktop file
    install -Dm644 "arch-update-helper.desktop" "$pkgdir/usr/share/applications/arch-update-helper.desktop"
}

