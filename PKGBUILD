# Maintainer: Jeff Henson <jeff at henson dot io>
# Old Maintainer: Michael Rolf <mi.rolf@gmx.net>
# Old Maintainer: Arkham <arkham at archlinux dot us>
# Contributor: Jérémie Dimino <jeremie at dimino dot org>
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=actkbd
pkgver=0.2.8
pkgrel=8
pkgdesc="A keyboard shortcut daemon"
arch=('i686' 'x86_64')
url="http://users.softlab.ece.ntua.gr/~thkala/projects/actkbd/"
license=('GPL')
backup=('etc/actkbd.conf')
depends=('glibc')
source=(http://users.softlab.ece.ntua.gr/~thkala/projects/actkbd/files/$pkgname-$pkgver.tar.bz2
	actkbd.service)
md5sums=('d055690da0465cefcf168c5532efcb2e'
         'e86dd1852596fcc64c5185804b3b9f3f')

build() {
    cd $srcdir/$pkgname-$pkgver
    make || return 1
}

package() {
    cd $srcdir/$pkgname-$pkgver

    make sysconfdir=$pkgdir/etc sbindir=$pkgdir/usr/bin install || return 1
    install -Dm 644 $srcdir/actkbd.service $pkgdir/usr/lib/systemd/system/${pkgname}.service

    # Install doc and examples
    install -d $pkgdir/usr/share/doc/actkbd/samples
    install -m 644 samples/* $pkgdir/usr/share/doc/actkbd/samples
    install -m 644 README FAQ $pkgdir/usr/share/doc/actkbd
}

