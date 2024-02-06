# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Original Submitter: Bob Finch <w9ya@arrl.net>

pkgname=fasttuna
pkgver=1.0
pkgrel=3
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
md5sums=('7992fe8d960b06d6a7324f955d35a23c'
         '70857407071f9dcf87c3c82c93a7fe53'
         'aa9a9e9e50ea35ac04b11b38a7738299')
sha256sums=('df04ea1f9b6e0ec804d3447f16ef2b35c65e38813932ac7f0bb9f93ce0bd4021'
            'e3ab6ff9aee0ad7ba4acf93baaf3857249d0cfe06cbc05a1d252b537d7296646'
            'f8e96c05b1eaada77fc58e3d4af91777a9f45cd2c9ec8b1e91fc426b0cb41dce')
