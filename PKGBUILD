# Maintainer: Daniel Gerbet <daniel.gerbet1 at tu-dresden dot de>

pkgname=python-adolc
pkgver=2.7.2
pkgrel=1
pkgdesc="automatic differentiation library with python bindings"
arch=('x86_64')
url="https://github.com/coin-or/ADOL-C"
license=('EPL' 'GPL2')
depends=('colpack' 'boost-libs' 'gcc-libs' 'glibc' 'python' 'python-numpy')
makedepends=('git' 'swig')
provides=('adol-c')
conflicts=('adol-c')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/releases/${pkgver}.tar.gz" 'setup.patch')
sha512sums=('b896650077367fd7388a6c5a40e5d8bb3f19af9e3bc5b067fd1d9a769809b77ccdfb5ef11ef481ab791c0f040401aaed0053cba55d4c2a3383c0d056122280f6'
            '74aae033216ceaa4fc57c4975e75061aa5b4cae10f30044bb2159e29a03bb2e8366bd50101fcc71c4e2f94e97ad05ff87b573b5a361d299044c518c06c886ae7')

_pkgname="ADOL-C-releases-${pkgver}"

prepare(){
	cd "${srcdir}"
	patch -p0 < setup.patch
}

build(){
	cd "${srcdir}/${_pkgname}"
	autoreconf -fsi
	./configure \
		--prefix="/usr" \
		--libdir="/usr/lib" \
		--enable-python \
		--enable-sparse
	make
}

check(){
	cd "${srcdir}/${_pkgname}"
	make -k check
}

package(){
	cd "${srcdir}/${_pkgname}"
	make DESTDIR="${pkgdir}" install
}
