# Maintainer: not_anonymous <nmlibertarian@gmail.com>

pkgname=pydxcluster
pkgver=2.21
pkgrel=2
pkgdesc="Python2 (tk) Ham Radio DX-Cluster GUI"
_dist=pyDxCluster
__dist=pyDXCluster
_ver=v2_21
arch=('any')
url="http://sourceforge.net/projects/pydxcluster/"
license=('GPL3')
depends=('python2-requests' 'python2-pygame' 'python2-xmltodict' 'hamradio-menus')
# "python2-xmltodict" is listed as a dep by the author. Is it really required ?? (!!)
source=(https://downloads.sourceforge.net/project/$pkgname/$__dist%20v$pkgver/${__dist}_$_ver.tar.gz
        $pkgname.desktop
        $pkgname.png
	$pkgname.1)

prepare() {
	cd $srcdir

	mv ${_dist}_${_ver}.py $pkgname.py
	rm -f *.txt
	sed -i 's:LICENSE:/usr/share/licenses/common/GPL3/license:' $pkgname.py
	sed -i 's:bin/python:bin/python2:' $pkgname.py
		# ^^^ this is required to make 'namcap' happy...wrapper takes care of this anyways.
}

package() {
	cd $srcdir

	mkdir -p $pkgdir/usr/share/$pkgname
	cp *.col $pkgdir/usr/share/$pkgname
	cp *.cfg $pkgdir/usr/share/$pkgname
	cp *.py $pkgdir/usr/share/$pkgname
	install -D -m 644 *.wav $pkgdir/usr/share/$pkgname

	mkdir -p $pkgdir/usr/bin
	install -D -m 755 $pkgname.1 $pkgdir/usr/bin/$pkgname

	mkdir -p $pkgdir/usr/share/{applications,pixmaps}
	install -D -m 644 $pkgname.png $pkgdir/usr/share/pixmaps
	install -D -m 644 $pkgname.desktop $pkgdir/usr/share/applications
}
md5sums=('d49f29f55cadf08c60c65b0d92dd8e8a'
         '047de11f8b1f7a2433008d10732341da'
         'd03076d6792be993b1d52cece985373d'
         '91e8c4dec7b2db265d08daa8d6701c45')
sha256sums=('f6dc61f23edda77d1346082ba7b14ab3f627a6cd746fd7db04de361975bf1e2c'
            'b79a160b020a66a2f02d6bda7c5e1772c01c74fce4caa6a3eb5e8eeeb506a83e'
            '797cd5764b045edf71c95f2b874d2705e8296460730e80e2b32311b6705c33a8'
            'e0a3e54cefe7cbe72392bf0168414377187d7deab000a25c563bf0d761817f24')
