pkgname=javagui
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple graphical application script for archlinux-java to manage your java versions."
arch=('any')
url="https://gitlab.com/linuxbombay/javagui"
license=('GPL')
depends=('java-runtime-common' 'polkit' 'zenity')
source=("https://gitlab.com/linuxbombay/javagui/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('b858585191850207467a450c76d5fb5d12180896268186d7199ba27e4808d338')

package() {
    for dir in $pkgname-$pkgver-$pkgrel-* ; do mv "${dir}" "$pkgname" ;done
    cd "$srcdir/$pkgname"
    chmod +x $pkgname

    # Link to binary
    install -dm755 "$pkgdir/usr/bin"
    cp "$srcdir/$pkgname/$pkgname" "$pkgdir/usr/bin/$pkgname"
    
    # Desktop Entry
    install -Dm644 "$srcdir/$pkgname/$pkgname.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i s%/usr/share%/opt% "$pkgdir/usr/share/applications/$pkgname.desktop"
}
