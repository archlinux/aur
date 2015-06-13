# Maintainer: SanskritFritz (gmail)

pkgname=pythagora-git
_gitname="Pythagora"
pkgver=2014.07.02
pkgrel=2
epoch=1
pkgdesc="MPD frontend using Qt, supports Shoutcast and Icecast (legally)."
arch=('i686' 'x86_64')
url="http://www.tarmack.eu/pythagora.html"
license=('Apache 2.0')
depends=('python2-pyqt4' 'python2-mpd' )
optdepends=('python2-dbus: for notification support')
makedepends=('git')
provides=('pythagora')
conflicts=('pythagora')
source=('pythagora.sh' 'Pythagora.desktop' "git+https://github.com/tarmack/Pythagora.git")

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

package() {
	install -dm755 "$pkgdir/usr/share/$_gitname"
	cp -r "$srcdir/$_gitname" "$pkgdir/usr/share"
	rm -r "$pkgdir/usr/share/$_gitname/.git"
	sed -i "s/python/python2/" "$pkgdir/usr/share/$_gitname/pythagora"
	install -Dm755 "$srcdir/pythagora.sh" "$pkgdir/usr/bin/pythagora"
	install -Dm644 "$srcdir/Pythagora.desktop" "$pkgdir/usr/share/applications/Pythagora.desktop"
}

md5sums=('8be1898b3f9b46cc8407d2e69e4be5b0'
         '96ddb5394ec4b6d29eb6b7d979106792'
         'SKIP')
