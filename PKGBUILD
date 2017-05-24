# Maintainer: Ziga Patacko Koderman <ziga.patacko@protonmail.com>
# Maintainer: Vid Drobnic <vid.drobnic@protonmail.com>
# Maintainer: Matej Marinko <matejmarinko123@gmail.com>

pkgname=libelectronpass-git
pkgver=20170519.e434291
pkgdesc="Backend library for ElectronPass desktop app."
pkgrel=1
arch=('any')
url='https://electronpass.github.io'
license=('GPL3')
depends=('libsodium' 'gcc-libs')
makedepends=('git')
provides=('libelectronpass')
groups=('electronpass')

_gitroot="git://github.com/electronpass/libelectronpass.git"
_gitbranch=master
_gitname=libelectronpass
source=(${_gitname}::${_gitroot})
md5sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_gitname}
	echo "$(git log -1 --format="%cd" --date=short | tr -d '-').$(git log -1 --format="%h")"
}

prepare() {
	mkdir -p build
}

build() {
	cd build
	cmake ../${_gitname}
	make
}

package() {
	cd build
	make DESTDIR="${pkgdir}" install
}
