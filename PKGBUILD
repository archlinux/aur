# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submitter: Bob Finch <w9ya@arrl.net>

pkgname=fasttuna
pkgver=1.0
pkgrel=2
pkgdesc="Ham Radio - Elecraft K2 CLI-based Rig Control"
arch=('i686' 'x86_64')
url="http://hamsoftware.org/old_index.html"
license=('GPL')
depends=('gcc-libs')
source=(http://www.hamsoftware.org/$pkgname.tgz
#http://www.qsl.net/ab6cv/$pkgname.tgz
	diff.commport.cpp
	diff.main.cpp)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.commport.cpp
	patch -p0 < ../diff.main.cpp
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
	make || return 1
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make prefix=$pkgdir/usr install
	mv $pkgdir/usr/bin/kookoo $pkgdir/usr/bin/fasttuna

	mkdir -p $pkgdir/usr/share/fasttuna/docs
	cp -a kookoo/docs/en/*.??ml $pkgdir/usr/share/fasttuna/docs
}
md5sums=('e54d204076016c8f3bfac8fca36ad460'
         '70857407071f9dcf87c3c82c93a7fe53'
         'aa9a9e9e50ea35ac04b11b38a7738299')
sha256sums=('657546c5fd0f625dd38b6220353a1ec8cdd4113370ed6104c2386516a381ee84'
            'e3ab6ff9aee0ad7ba4acf93baaf3857249d0cfe06cbc05a1d252b537d7296646'
            'f8e96c05b1eaada77fc58e3d4af91777a9f45cd2c9ec8b1e91fc426b0cb41dce')
