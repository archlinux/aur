# Maintainer: éclairevoyant
# Contributor: Kyle Keen <keenerd at gmail dot com>

pkgname=oyepa
pkgver=3.2
pkgrel=2
pkgdesc="Tagging file system emulator"
arch=(any)
url="https://pages.stern.nyu.edu/~marriaga/software/$pkgname"
license=(GPL2)
depends=(python2-pyinotify python2-pyqt4)
source=("$pkgname-$pkgver.tgz::$url/$pkgname-latest.tgz")
b2sums=('b7f6a7f0468144465b86262071ba743e1232bcc3cdb50324862a8fa7ffb85a1e8e29e2ca010091a6565e90fe4ad82dbecff80f61921de7387ab4d2fe71cf7fb5')
install=$pkgname.install

prepare() {
	sed -i 's|/usr/bin/env python|\02|' $pkgname-$pkgver/*.py
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 *.py -t "$pkgdir/usr/share/$pkgname/"
	install -Dm644 *.png CHANGE.LOG COPYING README TODO -t "$pkgdir/usr/share/$pkgname/"
	install -Dm644 icons/* -t "$pkgdir/usr/share/$pkgname/icons/"

	install -d "$pkgdir/usr/bin"
	ln -s /usr/share/$pkgname/oyepa.py         "$pkgdir/usr/bin/oyepa"
	ln -s /usr/share/$pkgname/oyepa-filemon.py "$pkgdir/usr/bin/oyepa-filemon"
	ln -s /usr/share/$pkgname/mp.py            "$pkgdir/usr/bin/mp.py"
	ln -s /usr/share/$pkgname/ds.py            "$pkgdir/usr/bin/ds"
	ln -s /usr/share/$pkgname/wnote.py         "$pkgdir/usr/bin/wnote"
}
