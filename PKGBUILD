# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Vitaliy Berdinskikh ur6lad[at]i.ua
# Original Submission: Bob Finch <w9ya@qrparci.net>

pkgname=yfktest
pkgver=r385.a4cabae
#r385.a4cabae
pkgrel=2
pkgdesc="Ham Radio Contesting Logger"
arch=('any')
url="http://fkurz.net/ham/yfktest.html"
license=('GPL')
depends=('xfce4-terminal' 'perl-curses' 'cty' 'masterscp'\
	 'hamlib' 'winkeydaemon' 'hamradio-menus')
makedepends=('git')
optdepends=('cwdaemon: transmitting cw'
	    'bigcty: country files, EVERYDAY version'
	    'mplayer: voice keyer')
source=("$pkgname::git+https://git.fkurz.net/yfktest/yfktest.git"
	 $pkgname.desktop
	 $pkgname.png
	 $pkgname.1)


pkgver() {
	cd "$srcdir/$pkgname"

	printf "r%s.%s" "$(git rev-list --count HEAD)"\
		 "$(git rev-parse --short HEAD)"
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
         'abe8a35ac8cee372c002f95a74f669b4'
         '0c5fc02db4577b3b1ffcc23e5c7a2b8e'
         'a5b6724edc0adb82e53870c81dac4281')
sha256sums=('SKIP'
            '68884be1f2e38c9f6c2c55976120c6f0c38d8ba79efee39aa2b9ac8fbc25e1fe'
            'ae4886c24e08425d7a9d6c31290924f8b328d0b2fe59b3d0c0e94ecf4d62b039'
            'c5018a263f314eca09561d8daa8f15b5de1b31f97811ca6d52a65b0b20e63409')
