pkgname=desktime
pkgver=5.1.30
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('i686' 'x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?i386")
    md5sums=('124d4dc0bfc27dd12c1f7bdd01c842e1')
else
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?x64")
    md5sums=('4521ce6d95e24af9377109252a12334a')
fi

package()
{
    cd "$srcdir"
    bsdtar -xf data.tar.xz -C "$srcdir/"

    mkdir -p "$pkgdir"/usr
    cp -a "$srcdir/usr/lib" "$pkgdir/usr/"
    cp -a "$srcdir/usr/share" "$pkgdir/usr/"

    sudo rm -f /usr/bin/desktime-linux
    sudo ln -s "/usr/lib/desktime-linux/desktime-linux" "/usr/bin/desktime-linux"
}

# vim:et:sw=4:sts=4
