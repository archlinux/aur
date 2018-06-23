# Maintainer: 01189998819991197253 <dev.ben01189998819991197253+aur@gmail.com>
pkgname=clonehero
pkgver=0.20
pkgrel=1
pkgdesc="Clone of Guitar Hero and Rockband-style games"
arch=('x86_64')
url="https://www.reddit.com/r/CloneHero/"
license=('freeware-proprietary')
makedepends=('p7zip')
depends=('gtk2')
source=("$pkgname-$pkgver.rar::https://drive.google.com/uc?export=download&id=13XrAOJoihFMrdyjYnmENAC5FOApSPcin"
        "$pkgname.sh"
        "$pkgname.desktop")
noextract=("$pkgname-$pkgver.rar")
sha256sums=('566c2f6a82a7254a937d0e755eb644ad62bc329ffb5e56998768d8741177cdbf'
            '821939bd6b5c60f27172003492250135ccf1ea45f7dcb681643749aef30e02f3'
            '869ceab4a12d7d0586ed1227288f9b65c93d2295bd7cffebbc235f7bc97459e1')

prepare() {
    7z -y x "$pkgname-$pkgver.rar"
}

package() {
    install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "$srcdir/README README README.txt" "$pkgdir/usr/share/licenses/$pkgname/README.txt"
    install -Dm644 "$srcdir/Changelog.txt" "$pkgdir/usr/share/licenses/$pkgname/Changelog.txt"

    # Set pkgname in runscript
    sed -i "s/^pkgname=.*/pkgname=$pkgname/" "$srcdir/$pkgname.sh"
    install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"

    # Prevent lingering symlinks
    rm "$srcdir/$pkgname.desktop"
    rm "$srcdir/$pkgname.sh"
    rm "$srcdir/$pkgname-$pkgver.rar"
    
    install -dm755 "$pkgdir/opt"
    cp -r "$srcdir" "$pkgdir/opt/$pkgname"

    find "$pkgdir/opt/$pkgname" -type d -exec chmod 755 {} +
    find "$pkgdir/opt/$pkgname" -type f -exec chmod 644 {} +
    chmod +x "$pkgdir/opt/$pkgname/Clone Hero.x86_64"
    chmod 755 "$pkgdir/opt/$pkgname/Clone Hero_Data/"
}

