# Maintainer: driizzyy <your-email@example.com>
pkgname=aerofetch
pkgver=2.0
pkgrel=1
pkgdesc="Universal system information tool with multi-distro support and advanced monitoring"
arch=('any')
url="https://github.com/driizzyy/AeroFetch"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=('git')
optdepends=('lsb-release: for detailed OS information'
           'xorg-xrandr: for resolution detection'  
           'util-linux: for additional system info'
           'pciutils: for GPU detection'
           'wmctrl: for window manager info'
           'flatpak: for flatpak package count'
           'snapd: for snap package count'
           'nix: for nix package count')
provides=('aerofetch')
conflicts=('aerofetch-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/driizzyy/AeroFetch/archive/v$pkgver.tar.gz")
sha256sums=('b4d84b376fe24e9d2c89eeb108abfa888cd1c795d9615ea2e1567b77b838ad92')

package() {
    cd "$srcdir/AeroFetch-$pkgver"
    
    # Install the main script
    install -Dm755 AeroFetch.sh "$pkgdir/usr/bin/aerofetch"
    
    # Create command aliases as symlinks
    install -d "$pkgdir/usr/bin"
    ln -sf aerofetch "$pkgdir/usr/bin/aero"
    ln -sf aerofetch "$pkgdir/usr/bin/A-"
    
    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    
    # Install license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    # Install man page
    install -Dm644 aerofetch.1 "$pkgdir/usr/share/man/man1/aerofetch.1"
}