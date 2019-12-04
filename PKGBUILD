# Maintainer: Matteo Triggiani <davvore33@gmail.com>
pkgname=('elgato-gchd')
pkgver=0.2.0
pkgrel=1
pkgdesc="This project provides a userspace driver to natively support the Elgato Game Capture HD under Linux and Mac OS X. This is an unofficial driver and in no way supported by Elgato."
arch=('x86_64')
url="https://github.com/tolga9009/elgato-gchd"
license=('MIT')
makedepends=('cmake' 'git')
md5sums=('SKIP')


_gitroot='https://github.com/tolga9009'
_gitname='elgato-gchd'
source=("$_gitname"::git+"$_gitroot"/"$_gitname".git)

prepare(){
	cd "${srcdir}/${_gitname}/"
	git checkout tags/$pkgver
	mkdir -p build && cd build

	cmake ..
}

build() {

	cd "${srcdir}/${_gitname}/build"
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make DESTDIR="$pkgdir/" install
}


