pkgname=javagui
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple graphical application script for archlinux-java to manage your java versions."
arch=('any')
url="https://gitlab.com/javaguimgr/javagui"
license=('GPL')
depends=('java-runtime-common' 'polkit' 'zenity')
source=("https://gitlab.com/javaguimgr/javagui/-/archive/$pkgver-$pkgrel/application-$pkgver-$pkgrel.tar.bz2")
sha256sums=('SKIP')

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
