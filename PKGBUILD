pkgname=betterautolock
pkgver=0.1
pkgrel=1
pkgdesc="betterlockscreen administration and suspend service"
arch=('any')
license=('gpl')
depends=('feh' 'betterlockscreen')
replaces=('xlock')

package() {
    mkdir -p $pkgdir/etc/systemd/system
    mkdir -p $pkgdir/usr/bin
    tmp=$(mktemp)
    cat $srcdir/../screenlock.service.in | sed "s/%USER%/$USER"/g > $tmp
    install -m755 $tmp $pkgdir/etc/systemd/system/betterautolock.service
    install -m755 $srcdir/../xlock $pkgdir/usr/bin/xlock
    install -m755 $srcdir/../fehbg $pkgdir/usr/bin/fehbg
    install -m755 $srcdir/../update_lock_wallpaper $pkgdir/usr/bin
}

