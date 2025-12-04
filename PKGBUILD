# Maintainer: wheremygit
pkgname=tvs-e-pos-printer-driver
pkgver=1.2.0
pkgrel=1
pkgdesc="TVS-E RP-3230 POS printer driver for Linux"
arch=('i686' 'x86_64')
url="https://github.com/wheremygit/tvs-e-pos-printer-driver"
license=('custom')
depends=('cups')  # required printing system
source=("https://github.com/wheremygit/tvs-e-pos-printer-driver/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # Create target directories first
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/lib/cups/filter"
    install -dm755 "$pkgdir/usr/share/cups/model"

    # Copy scripts
    install -Dm755 install "$pkgdir/usr/bin/tvs-e-pos-install"
    install -Dm755 uninstall "$pkgdir/usr/bin/tvs-e-pos-uninstall"

    # Copy PPD files
    install -Dm644 ppd/* "$pkgdir/usr/share/cups/model/"

    # Copy filter binaries
    install -Dm755 filter/x86/raster-esc "$pkgdir/usr/lib/cups/filter/raster-esc-x86"
    install -Dm755 filter/x64/raster-esc "$pkgdir/usr/lib/cups/filter/raster-esc-x64"
}

