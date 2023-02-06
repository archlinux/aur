# Maintainer: Xavier (sapphirus at azorium dot net)

_pkgbase=libancient
pkgname=${_pkgbase}-git
pkgver=2.0.0.r6.c35638e
pkgrel=1
pkgdesc="Decompression routines for ancient formats (Git Version)"
arch=('i686' 'x86_64')
url="https://github.com/temisu/ancient/"
license=('BSD-2-Clause')

conflicts=(${_pkgbase})
provides=(${_pkgbase}=${pkgver})

#depends=('')

makedepends=('git'
	     'autoconf-archive')

source=(${_pkgbase}::git+https://github.com/temisu/ancient.git)
md5sums=('SKIP')


pkgver() {
    	cd $_pkgbase
	echo "$(git describe --tags | sed 's/^v//; s/-/.r/; s/-g/./')"
}

prepare() {
	cd $_pkgbase
	./autogen.sh
	./configure --prefix=/usr LIBANCIENT_CXXFLAGS="-DANCIENT_API_VISIBILITY_DEFAULT -std=c++17" 
}


build() {
  	cd $_pkgbase	
	make DESTDIR="$pkgdir"
}

package() {
	cd $_pkgbase
	make DESTDIR="$pkgdir" install
}
