# Maintainer: Daniel Lima <danielm@tinyhub.tk>

pkgname=ccv
pkgver=0.7
pkgrel=1
pkgdesc='The C-based/Cached/Core Computer Vision Library'
arch=('i686' 'x86_64')
url='http://libccv.org/'
license=('BSD3')
depends=('gsl' 'libpng' 'zlib' 'fftw' 'blas' 'liblinear') 
makedepends=('subversion' 'gcc')
optdepends=('ccv-samples: sample datasets')
source=('svn+https://github.com/liuliu/ccv/stable/doc'
        'svn+https://github.com/liuliu/ccv/stable/lib'
        'https://raw.githubusercontent.com/liuliu/ccv/stable/COPYING')
md5sums=('SKIP'
         'SKIP'
         'SKIP')

build() {
	cd lib
	./configure
	make -j`nproc` libccv.a
}

package() {
	mkdir -p $pkgdir/usr/doc
	install -D -m644 COPYING $pkgdir/usr/share/licenses/ccv/COPYING
	cp -r doc $pkgdir/usr/doc/ccv
	cd lib
	install -D -m644 libccv.a $pkgdir/usr/lib/libccv.a
	find -name '*.h' | while read -r f; do
		install -D -m644 $f $pkgdir/usr/include/ccv/$f
	done
}

