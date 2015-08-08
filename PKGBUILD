# Maintainer: timttmy <marshall\\dot//cleave\\at//tiscali\\dot//co\\dot//uk>

pkgname=heybuddy
pkgver=0.2.5
pkgrel=4
pkgdesc="A light/feature free client for the identi.ca microblogging site."
arch=('i686' 'x86_64') 
url="https://launchpad.net/heybuddy/"
license=('GPL3')
depends=('python2' 'pygtk')
makedepends=('sed')
optdepends=('gtkspell' 'python2-gtkspell' 'libnotify')
provides=(heybuddy)
conflicts=(heybuddy-trunk-bzr)
install=heybuddy.install
source=(http://launchpad.net/heybuddy/0.2/$pkgver/+download/$pkgname-$pkgver.tgz $pkgname.desktop)
md5sums=('d5ee49ecad0d0efd9f1ca1990bc1c792' '68d0c01882c9db6ae6381b49e3507eea')
build() {
	echo "Done"
}
package() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i 's/env\ python/env\ python2/' heybuddy.py || return 1
	mkdir -p "$pkgdir/usr/share/heybuddy" || return 1
	mkdir -p "$pkgdir/usr/bin/" || return 1
	mkdir -p "$pkgdir/usr/share/pixmaps/" || return 1
	cp -a ./ "$pkgdir/usr/share/heybuddy/" || return 1
	ln -sf /usr/share/heybuddy/heybuddy.py "$pkgdir/usr/bin/heybuddy" || return 1
	install -m 644 $srcdir/$pkgname-$pkgver/assets/icon.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 $startdir/$pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	python2 -m compileall "$pkgdir/usr/share/heybuddy"
}
