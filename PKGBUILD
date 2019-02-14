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
makedepends=('megacmd-bin')
depends=('gtk2')
source=("SHA256SUM"
        "$pkgname.install"
        "$pkgname.sh"
        "$pkgname.desktop")
sha256sums=('4bc58ac7cb113d9d0df67a57b27522d0fdd8acdc34b5c86194c01601bf94c92e'
            '01125237ef90f8435523fed5ae09246a76eb562408c50e76597964b5675385cf'
            '6ce5bd0b73e704b7221d8d03a77ffa66d887685ee7e57ccecf704a73caaae53a'
            'a97d85930ac4844b3c5e90d4da8faa7a9b5267909d45be59b1fa39abc76df5fe')

prepare() {
    mega-get https://mega.nz/#!DE8ghYRL!loJZ0poH0QaIlhsuC4mWs7w14M9yP9t_3iTMTKeJchk
    sha256sum --check SHA256SUM
    tar -xzvf $pkgname-linux.tar.gz
}

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

