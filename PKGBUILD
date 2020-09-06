# Maintai$ner: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=yfktest
pkgver=r385.a4cabae
pkgrel=1
pkgdesc="Ham Radio Contesting Logger"
arch=('any')
url="http://fkurz.net/ham/yfktest.html"
license=('GPL')
depends=('perl-curses' 'hamradio-menus' 'cty' 'masterscp')
makedepends=('subversion')
optdepends=('hamlib: rig interfacing'
	    'cwdaemon: transmitting cw'
	    'winkeydaemon: usb cw xmit'
	    'bigcty: contest version country files'
	    'mplayer: voice keyer')
source=("$pkgname::git+https://git.fkurz.net/yfktest/yfktest.git"
#("$pkgname::svn://svn.fkurz.net/yfktest/trunk"
		$pkgname.desktop
		$pkgname.png
		$pkgname.1)


pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)"\
		 "$(git rev-parse --short HEAD)"
#	printf "r%s" "$(svnversion | tr -d 'A-z')"
}


package() {
	cd "$srcdir/$pkgname"
	install -d $pkgdir/usr/share/$pkgname

	cp -a * $pkgdir/usr/share/$pkgname
	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications

	cd "$pkgdir/usr/share/$pkgname"
	cp -a docs/MANUAL docs/FAQ-NEW-INFO .
	rm -rf cty.dat master.scp README* winkey* yfktest.* docs/ misc/
	sed -i s:'.\/yfktest ':'yfktest ': subs/newcontest.pl
	sed -i s:'.\/yfktest ':'yfktest ': yfktest
	sed -i s:'.\/yfktest ':'yfktest ': MANUAL
}
md5sums=('SKIP'
         'b8fc8f2685c87b2bf5c509ffa82d1387'
         '0c5fc02db4577b3b1ffcc23e5c7a2b8e'
         'a5b6724edc0adb82e53870c81dac4281')
sha256sums=('SKIP'
            '59d1cc347697a5f34ab465bf5d3c2437b18981d473d39e9e4a267604ac87bec8'
            'ae4886c24e08425d7a9d6c31290924f8b328d0b2fe59b3d0c0e94ecf4d62b039'
            'c5018a263f314eca09561d8daa8f15b5de1b31f97811ca6d52a65b0b20e63409')
