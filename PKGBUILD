# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: WB2FKO <mph at sportscliche dot com>

pkgname=qle
pkgver=0.0.39
pkgrel=2
pkgdesc="QSO logger and log editor"
arch=('any')
url="http://home.kpn.nl/w.knol18/qle/qle.html"
license=('GPL')
depends=('perl>=5.10.0' 'perl-tk' 'sqlite3' 'sqlite3-doc' 'perl-pdf-labels' 'perl-dbd-sqlite' 
	 'perl-dbi' 'perl-config-general' 'perl-term-twiddle-qle' 'desktop-file-utils'
	 'perl-tk-splash>=0.16')
optdepends=('hamlib: rig interfacing'
	    'cwdaemon: transmitting cw'
	    'winkeydeamon: usb cw xmit'
	    'perl-tk-fontdialog: font choosing'
	    'masterscp: supercheckpartial files'
	    'cty: country files'
	    'bigcty: contest version country files')
install=$pkgname.install
source=(http://home.kpn.nl/w.knol18/qle/$pkgname-$pkgver.tar.gz
        $pkgname.desktop
        $pkgname.png
	$pkgname.1)

prepare() {
	cd "$srcdir/$pkgname-$pkgver/"
	sed -i s:'=$HOME\S*':'=$HOME/qle': qle.sh
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -d $pkgdir/usr/share/$pkgname
	cp -a $srcdir/$pkgname-$pkgver/* $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('603d1d135e319052a0aa49c0481d8a5b'
         'b857e609ba681a0b165cd4fe6892844f'
         '5b60b0fe52cb3ca0fab0cfe87a5f0c8a'
         '5336ffafaf571479902a7fedad2eb1e5')
sha256sums=('9f69df697823ff0ef1aa96106f3dce9cc20d893870651fbbd777875182fc8e5e'
            '382596bf1c17c2325cf5fb9bd80c3e9d9384d24a2bf137c1dbfa135f51dbfdb4'
            'a01093436465b946dc39d49a69ddf55ab9ec7ae56d4408167d03bbf698c5c570'
            'cfa9eea5728466b61b1852ea85fdfe6085b63b2fd73fe11168799e7015f351aa')
