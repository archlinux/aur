# Maintainer: Xavier (sapphirus at azorium dot net)

_pkgbase=libancient
pkgname=${_pkgbase}
pkgver=2.0.0
pkgrel=1
pkgdesc="Decompression routines for ancient formats"
arch=('i686' 'x86_64')
url="https://github.com/temisu/ancient/"
license=('BSD-2-Clause')

conflicts=(${_pkgbase}-git)
provides=(${_pkgbase}=${pkgver})

#depends=('')

makedepends=('git'
	     'autoconf-archive')

source=(${_pkgbase}::git+https://github.com/temisu/ancient.git#tag=v${pkgver})
md5sums=('SKIP')

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
