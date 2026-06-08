# Maintainer: birrkan

# Package name and version
pkgname=huiontablet-driver-and-software
pkgver=15.0.0.175
pkgrel=1

# Package metadata
pkgdesc="Huion Tablet Driver Setting Software"
arch=('x86_64')
url="https://www.huion.com/download"
license=('custom:Huion')

direct_url="https://driverdl.huion.com/driver/Linux/HuionTablet_LinuxDriver_v15.0.0.175.x86_64.deb"
source=("HuionTablet_LinuxDriver_v${pkgver}.x86_64.deb::${direct_url}")
noextract=("HuionTablet_LinuxDriver_v${pkgver}.x86_64.deb")
sha256sums=('SKIP')

# Runtime dependencies (most libs are bundled in /usr/lib/huiontablet/libs/)
depends=('glibc' 'gcc-libs' 'libx11' 'xdotool')

# Pacman install script (post_install, pre_upgrade, etc.)
install="${pkgname}.install"

package() {
    echo "-> Extracting .deb package..."
    cd "$srcdir"
    ar x "HuionTablet_LinuxDriver_v${pkgver}.x86_64.deb"
    tar xf data.tar.xz -C "$pkgdir"

    echo "-> Setting permissions on binaries..."
    chmod 755 "$pkgdir/usr/lib/huiontablet/huiontablet"
    chmod 755 "$pkgdir/usr/lib/huiontablet/huionCore"

    echo "-> Done."
}

# makepkg --printsrcinfo > .SRCINFO
