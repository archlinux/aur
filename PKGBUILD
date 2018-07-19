# Maintainer: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
pkgname=clonehero
pkgver=0.21.6
pkgrel=1
pkgdesc="Clone of Guitar Hero and Rockband-style games"
arch=('x86_64')
url="https://www.reddit.com/r/CloneHero/"
license=('freeware-proprietary')
install="$pkgname.install"
makedepends=('p7zip')
depends=('gtk2')
source=("$pkgname-$pkgver.7z::https://github.com/ben01189998819991197253/aur-pkgbuilds/releases/download/$pkgver/$pkgname-$pkgver.7z"
        "$pkgname.install"
        "$pkgname.sh"
        "$pkgname.desktop")
noextract=("$pkgname-$pkgver.7z")
sha256sums=('2653adc252a8135cf5f81d692554e88a4dea731dc793c4d1c06ad5c4f3254724'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            '4f16cc3439d1b4004112a9fa5dcfbfbf009cf513fffedf004b6e7e82eb85d33a'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe')

prepare() {
    7z -y x "$pkgname-$pkgver.7z"
}

package() {
    install -dm755 "$pkgdir/opt/"
    cp -r "$srcdir/$pkgname-linux" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/Clone Hero.x86_64"

    # Install script, .desktop launcher with icon
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/$pkgname-linux/README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
    install -Dm644 "$srcdir/$pkgname-linux/Clone Hero_Data/Resources/UnityPlayer.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

