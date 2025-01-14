# Maintainer: Hadi Chokr <hadichokr@icloud.com>
pkgname=arch-update-helper-git
pkgver=9661de6
pkgrel=1
pkgdesc="A Systray Utility for Checking Arch Linux Updates and Installing Them"
arch=('x86_64')
url="https://github.com/silverhadch/arch-update-helper"
license=('GPL3')
depends=('qt6-base')  # Add dependencies like 'cmake' if needed
makedepends=('git' 'cmake')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    # Create the build directory and build the binary
    mkdir -p build
    cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"

    # Install the binary
    install -Dm755 "build/Arch-Update-Helper" "$pkgdir/usr/bin/Arch-Update-Helper"

    # Install the Man Page 
    install -Dm 644 "man/arch-update-helper.1.gz" "$pkgdir/usr/share/man/man1/arch-update-helper.1.gz"
    
    # Install the .desktop file
    install -Dm644 "arch-update-helper.desktop" "$pkgdir/usr/share/applications/arch-update-helper.desktop"
}

