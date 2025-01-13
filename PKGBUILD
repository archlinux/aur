# Maintainer: Hadi Chokr <hadichokr@icloud.com>
pkgname=arch-update-helper
pkgbase=arch-update-helper
pkgver=1.0.0
pkgrel=1
pkgdesc="A Systray Utility for Checking Arch Linux Updates and Installing Them"
arch=('any')
url="https://github.com/silverhadch/arch-update-helper"
license=('GPL3')
depends=('qt6-base' 'cmake')  # Add dependencies like 'cmake' if needed
makedepends=('git')
source=("git+${url}.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"

    # Create the build directory and build the binary
    mkdir -p build
    cmake -Bbuild -H. -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/$pkgname"

    # Install the binary
    install -Dm755 "build/Arch-Update-Helper" "$pkgdir/usr/bin/Arch-Update-Helper"

    # Install the configuration file
    install -Dm644 "config/arch-update-helper" "$pkgdir/etc/skel/.config/arch-update-helper"

    # Install the .desktop file
    install -Dm644 "arch-update-helper.desktop" "$pkgdir/etc/xdg/autostart/arch-update-helper.desktop"
}

