# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>

pkgname=qle
pkgver=0.0.40
pkgrel=1
pkgdesc="QSO logger and log editor"
arch=('any')
url="http://home.kpn.nl/w.knol18/qle/qle.html"
license=('GPL')
depends=('perl>=5.10.0' 'perl-tk' 'sqlite3' 'sqlite3-doc' 'perl-pdf-labels' 'perl-dbd-sqlite' 
	 'perl-dbi' 'perl-config-general' 'perl-term-twiddle-qle' 'perl-tk-splash>=0.16'
	 'hamradio-menus')
optdepends=('hamlib: rig interfacing'
	    'cwdaemon: transmitting cw'
	    'winkeydaemon: usb cw xmit'
	    'perl-tk-fontdialog: font choosing'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files')
source=(http://home.kpn.nl/w.knol18/qle/$pkgname-$pkgver.tar.gz
        $pkgname.desktop
        $pkgname.png
	$pkgname.1)

prepare() {
	cd $srcdir/$pkgname-$pkgver/
	sed -i s:'=$HOME\S*':'=$HOME/qle': qle.sh
}

package() {
	cd $srcdir/$pkgname-$pkgver/

	install -d $pkgdir/usr/share/$pkgname
	cp -a $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/$pkgname
	rm $pkgdir/usr/share/$pkgname/COPYING

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('a9af22383c5c93183a7d9cb539b08264'
         'b857e609ba681a0b165cd4fe6892844f'
         '5b60b0fe52cb3ca0fab0cfe87a5f0c8a'
         '6d96b9ef2d85019c2630819db6e2e369')
sha256sums=('37583ab5a7fd39ba9e5c87c42fe7b9112ab5cf4605b217c13dac193379409e81'
            '382596bf1c17c2325cf5fb9bd80c3e9d9384d24a2bf137c1dbfa135f51dbfdb4'
            'a01093436465b946dc39d49a69ddf55ab9ec7ae56d4408167d03bbf698c5c570'
            '75f688dddbddada3c9ade3a6a74809853ad3f15f94ed4d85f410ad7cdcc5a20c')
