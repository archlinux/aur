# Maintainer: NicKoehler <grillinicolavocal at gmail dot com>
# Contributor: Eric Brandwein <brandweineric at gmail dot com>
# Contributor: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>

pkgname=clonehero
pkgver=1.0.0.4080
pkgrel=5
pkgdesc="Clone Hero is a free rhythm game, which can be played with any 5 or 6 button guitar controller, game controllers, or just your standard computer keyboard."
arch=('x86_64')
url="https://clonehero.net/"
license=('freeware-proprietary')
install="$pkgname.install"
depends=('gtk2')
source=("${pkgname}-${pkgver}.tar.xz"::"https://github.com/clonehero-game/releases/releases/download/V${pkgver}/CloneHero-linux.tar.xz"
        "$pkgname.install"
        "$pkgname.desktop"
        "$pkgname")

sha256sums=('6162d5fb0810f517ca45249687fc743cc8c1ead140e18a476fd5ad60e3a06592'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe'
            'e152f18dc38f47c0b0c52ff4227c7daa2fa5251fdf7f86683df1cd8274b24cb6')

package() {
    install -dm755 "$pkgdir/opt/"
    install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"

    cp -r "$srcdir/$pkgname-linux" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/$pkgname"

    # Install script, .desktop launcher with icon
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-linux/clonehero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
