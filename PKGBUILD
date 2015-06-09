# Maintainer : Antonio Orefice <kokoko3k@gmail.com>
pkgname=gopreload-git
pkgver=20131125
pkgrel=1
pkgdesc="Preloads files needed for given programs."
arch=('any')
license=('GPL')
depends=('strace' 'coreutils')
conflicts=('gopreload')
url="http://forums.gentoo.org/viewtopic-t-622085-highlight-preload.html"
_gitroot="https://github.com/kokoko3k/gopreload"
install=gopreload.install

build() {
	rm -R $srcdir/gopreload &>/dev/null || echo "No old repository found, proceding to git clone..."
	git clone --depth 1 $_gitroot || return 1
	cd $srcdir/gopreload/usr/share/gopreload/mapandlock.source
	./compile.sh && ./install.sh
	rm -R  $srcdir/gopreload/usr/share/gopreload/mapandlock.source
}
 
package() { 
	mv $srcdir/gopreload/* $pkgdir
	mkdir -p $pkgdir/usr/bin
	mkdir -p $pkgdir/usr/lib/systemd/system
	ln -s /usr/share/gopreload/bin/Prepare.sh $pkgdir/usr/bin/gopreload-prepare
}
