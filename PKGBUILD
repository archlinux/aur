# Maintainer: Blake Smith <blakesmith0@gmail.com>
# Old Maintainer: Nathan Jones <nathanj@insightbb.com>

pkgname=tinyfugue-patched
pkgver=5.0b8
pkgrel=1
pkgdesc="The best MUD client. Patched with log prefix and a more useful alert stream."
url="http://tinyfugue.sourceforge.net/"
depends=(pcre zlib ncurses openssl)
license=("GPL")
arch=('i686' 'x86_64')
conflicts=('tinyfugue')
replaces=('tinyfugue')

source=("http://downloads.sourceforge.net/sourceforge/tinyfugue/tf-50b8.tar.gz"
	"tf-50b7.alert.patch"
	"tf-50b7.build.patch"
	"tf-50b7.log_prefix.patch")

build() {
	cd $startdir/src/tf-50b8
	patch -p1 -i "${srcdir}/tf-50b7.alert.patch"
	patch -p1 -i "${srcdir}/tf-50b7.build.patch"
	patch -p1 -i "${srcdir}/tf-50b7.log_prefix.patch"
	mkdir $startdir/pkg/usr
	./configure --prefix=/usr --enable-termcap=ncurses
	make || return 1
	make prefix=$startdir/pkg/usr install || return 1
} 
md5sums=('3e994e791966d274f63b0e61abf2ef59'
         '395e6636969c518bafa0f86279a7e183'
         'ddb83f770b9fcbcd425143405abef327'
         '3c67ccfc6267502682f12af4fc221d34')
