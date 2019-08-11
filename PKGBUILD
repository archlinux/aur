# Maintainer: Matteo Triggiani <davvore33@gmail.com>
pkgname=('simon-kf5-git')
pkgver=0.5
pkgrel=3
pkgdesc="Simon is an open source speech recognition program that can replace your mouse and keyboard. The system is designed to be as flexible as possible and will work with any language or dialect"
arch=('i686' 'x86_64')
url="https://simon.kde.org/"
license=('GPLv2')
depends=('kdesignerplugin' 'qwt')
makedepends=('cmake' 'git')
optdepends=('pocketsphinx: speech recognition engine'
			'htk: create and modify the speech models'
			'julius: for speech recognition')
conflicts=('simon')
md5sums=('SKIP')

_gitroot='https://github.com/KDE'
_gitname='simon'
_gitbranch='kf5'
source=("$_gitname"::git+"$_gitroot"/"$_gitname".git\#branch="$_gitbranch" "qicon.patch")
md5sums=('SKIP'
         '8ac510cd7e9752dfe4ddcdde28ea417e')
prepare(){
	cp qicon.patch "${srcdir}/${_gitname}/"
	cd "${srcdir}/${_gitname}/"
	patch -p1 < qicon.patch

	mkdir -p build && cd build

	cmake .. -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix`
}

build() {
	cd "${srcdir}/${_gitname}/build"
	make
}

package() {
	cd "${srcdir}/${_gitname}/build"
	make DESTDIR="$pkgdir/" install
}

