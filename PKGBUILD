# Maintainer: Simon Templer <st at wetransform dot to>
pkgname=hale-studio-bin
pkgver=5.4.0
pkgrel=1
pkgdesc="An easy-to-use desktop application (spatial) data harmonisation. (binary package)"
arch=('x86_64')
url="https://github.com/halestudio/hale"
license=('LGPL-3.0-only')
depends=()
provides=('hale-studio')
conflicts=('hale-studio')
source=("hale-studio-${pkgver}.tar.gz::https://github.com/halestudio/hale/releases/download/v${pkgver}/hale-studio-${pkgver}-linux.gtk.x86_64.tar.gz"
        "hale-studio.desktop")
sha256sums=('b508111c5eea3e7b174dc794bc3c4e98be00fd68a0c7f7bc5a62ab2321e04fe9'
            '0ffe21233a8da0dfac96ca93a790b504d8a36417f8a1d734e0980bc13d52804b')

package() {
    install -d "$pkgdir/opt/hale-studio"
    tar -xzf "$srcdir/hale-studio-${pkgver}.tar.gz" -C "$pkgdir/opt/hale-studio" --strip-components=1

    # Install desktop entry
    install -Dm644 "$srcdir/hale-studio.desktop" "$pkgdir/usr/share/applications/hale-studio.desktop"

    # Install icon if available
    if [ -f "$pkgdir/opt/hale-studio/icon.xpm" ]; then
        install -Dm644 "$pkgdir/opt/hale-studio/icon.xpm" "$pkgdir/usr/share/pixmaps/hale-studio.xpm"
    fi
}
