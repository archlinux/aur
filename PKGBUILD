pkgname=desktime
pkgver=5.1.21
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('i686' 'x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?i386")
    md5sums=('d621182e7e8486392a7ce7b2c58fc8d5')
else
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?x64")
    md5sums=('69799a789d01d0f667e15abc3d1f6e9b')
fi

package()
{
    cd "$srcdir"
    bsdtar -xf data.tar.xz -C "$srcdir/"

    mkdir -p "$pkgdir"/usr
    cp -a "$srcdir/usr/lib" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"

    rm -f /bin/desktime-linux
    ln -s "/usr/lib/desktime-linux/desktime-linux" "/bin/desktime-linux"
}

# vim:et:sw=4:sts=4
