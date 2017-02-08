# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Bob Finch <w9ya@qrparci.net>

pkgname=tlf
_author=Tlf
pkgver=1.3.0
pkgrel=1
pkgdesc="Ham Radio networked logging and contest program - CLI"
arch=('i686' 'x86_64')
url="https://tlf.github.com/"
license=('GPL')
depends=('hamlib' 'xmlrpc-c' 'hamradio-menus')
makedepends=('autoconf' 'automake' 'pkg-config')
optdepends=('cwdaemon: transmitting cw'
	    'cty: country files'
	    'joe: editing qsos'
	    'xplanet: mapped qso display'
	    'fldigi: digital modes/modem & gui/display')
provides=('tlf')
conflicts=('tlf-git')
source=("https://github.com/$_author/$pkgname/archive/$pkgname-$pkgver.tar.gz"
#        http://sharon.esrac.ele.tue.nl/pub/linux/ham/tlf/nrau
        $pkgname.desktop
	$pkgname.png
        $pkgname.1)

build() {
	cd $srcdir/$pkgname-$pkgname-$pkgver

	autoreconf --install
	./configure --prefix=/usr --enable-hamlib --enable-fldigi-xmlrpc
  
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgname-$pkgver

	make prefix=$pkgdir/usr datadir=$pkgdir/usr/share install

#	cp ../nrau $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	mv $pkgdir/usr/bin/$pkgname $pkgdir/usr/bin/$pkgname.1
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('651c8e30e974fa804817c818c18242f7'
         'b83cca73cea288ed139993efceb245b5'
         'f148583e02660cb430f638fd8f71f452'
         'b706428f41d32bd5f4f6f671057638c0')
sha256sums=('18c834c084d991004f19682c67c5cb6ef2d34f3130e4d04b402f44f8e9cfa635'
            'cc7b5bcf825ea342d126a54a778c4f837ea0da4a12101383f99282041eb5d574'
            '0ddcde4f0dfa98540d4314660108ed49bfa0bc3d8b87cb46906dfd6f12be2497'
            '766253a6f4b1d7e0526366875a46e220d637665c3c44e551f8d3db4ed88aaf81')
