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
url="https://github.com/thkala/actkbd"
license=('GPL')
backup=('etc/actkbd.conf')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/thkala/actkbd/archive/refs/tags/v$pkgver.tar.gz"
        "actkbd.service")
sha256sums=('072d94990fb81932476cf35d028ed10b216145cb9b23e81cc86a5d6b4d0deab0'
            'ef552576c39aa3b2ecfd282c8a992c24f34b53ca4d73c264d2d2a88ba5248b19')

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
