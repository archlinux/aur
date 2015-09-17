# Maintainer: K. Hampf <k.hampf@gmail.com>
# Contriburor: Dan Serban (dserban01 => gmail)
# Contributor: Alexandre Gambini <chs_ale@msn.com>

pkgname=gitso
pkgver=0.6
pkgrel=4
pkgdesc="GUI frontend to reverse VNC connections"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gitso/"
license=('GPLv3')
depends=('iproute2' 'wxpython' 'x11vnc' 'tigervnc')
source=("http://gitso.googlecode.com/files/gitso_${pkgver}_linux_all.tar.gz")
md5sums=('095a89fa93a5af1fca4f02e6dda52631')

prepare() {
	ln -s "Gitso" "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	# Workarounds for two very annoying x11vnc quirks
	sed -i "s/'-nopw','-ncache','20'/'-nopw','-noxrecord','-xkb'/" share/gitso/Processes.py
}

package() {
	cd "$pkgname-$pkgver"
	mkdir $pkgdir/usr
	cp -r bin share $pkgdir/usr
	chmod -R +r $pkgdir/usr
	sed -i "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $pkgdir/usr/bin/gitso
	sed -i "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" $(find $pkgdir -name '*.py')
}
