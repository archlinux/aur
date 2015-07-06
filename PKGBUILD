# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pydxcluster
pkgver=1.2
pkgrel=2
pkgdesc="Python2 (tk) Ham Radio DX-Cluster GUI"
_dist=pyDxCluster
_ver=v1_2
arch=('any')
url="http://sourceforge.net/projects/pydxcluster/"
license=('GPL3')
depends=('python2-requests' 'desktop-file-utils')
install=$pkgname.install
source=(http://downloads.sourceforge.net/$pkgname/${_dist}_${_ver}.tar.gz
        $pkgname.desktop
        $pkgname.png
	$pkgname.1)

prepare() {
	cd "$srcdir/${_dist}_${_ver}/"
	mv ${_dist}_${_ver}.py $pkgname.py
	rm -f *.txt
	sed -i 's:LICENSE:/usr/share/licenses/common/GPL3/license:' $pkgname.py
}

package() {
	cd "$srcdir/${_dist}_${_ver}/"
	install -d $pkgdir/usr/share/$pkgname
	cp -a $srcdir/${_dist}_${_ver}/* $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 ../$pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 ../$pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 ../$pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('8ee5150a8f10271557b999ab0b1b07ed'
         '047de11f8b1f7a2433008d10732341da'
         'd03076d6792be993b1d52cece985373d'
         '26086372612eb51b3acfabefb94f24fe')
sha256sums=('c3f0dbe2c05dee1ebca9ee19f092332654eee9401492186e6a310b840b30f91c'
            'b79a160b020a66a2f02d6bda7c5e1772c01c74fce4caa6a3eb5e8eeeb506a83e'
            '797cd5764b045edf71c95f2b874d2705e8296460730e80e2b32311b6705c33a8'
            'ddbded75d30034bde6a206ba9e18c17d08bb1aba9edfe9f8934f10595b0d14bd')
