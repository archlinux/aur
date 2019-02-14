# Maintainer: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
pkgname=clonehero
pkgver=0.21.7
pkgrel=1
pkgdesc="Clone of Guitar Hero and Rockband-style games"
arch=('x86_64')
url="https://clonehero.net/"
license=('freeware-proprietary')
install="$pkgname.install"
depends=('gtk2')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ericbrandwein/clonehero-pkgbuild/releases/download/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname.install"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('8af40e5715fec803ad8661c12e2445fc62f3d37a76f9b51177e68a04eac9bc2a'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            '6ce5bd0b73e704b7221d8d03a77ffa66d887685ee7e57ccecf704a73caaae53a'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe')

package() {
    install -dm755 "$pkgdir/opt/"
    cp -r "$srcdir/$pkgname-linux" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/clonehero"

    # Install script, .desktop launcher with icon
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-linux/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
    install -Dm644 "$srcdir/$pkgname-linux/clonehero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

