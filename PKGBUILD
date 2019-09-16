pkgname=desktime
pkgver=5.1.28
pkgrel=0
pkgdesc="Desktime client for Linux"
arch=('i686' 'x86_64')
url="https://desktime.com"
license=(custom)
depends=(desktop-file-utils hicolor-icon-theme libappindicator-gtk2 libxss)
install=$pkgname.install

if [[ $CARCH == 'i686' ]]; then
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?i386")
    md5sums=('782411c676f9faf3f276421a8e7d3269')
else
    source=("$pkgname-$pkgver.deb::https://desktime.com/updates/linux/update/?x64")
    md5sums=('63992b87ffec49537ad9226e857f5583')
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
