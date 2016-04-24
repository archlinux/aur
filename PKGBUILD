# Maintainer: sinkuu <sinkuupump@gmail.com>

pkgname='xrestrict-git'
_gitname='xrestrict'
pkgver='r52.7729d84'
pkgrel=1
pkgdesc='A utility to modify the "Coordinate Transformation Matrix" of an XInput2 pointer device.'
arch=('i686' 'x86_64')
url='https://github.com/Ademan/xrestrict'
license=('MIT')
depends=('libx11' 'libxi' 'libxrandr')
makedepends=('autoconf' 'automake')
source=("git+https://github.com/Ademan/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_gitname}"
    autoreconf -i
    ./configure
    make
}

package() {
    cd "${srcdir}/${_gitname}"
    make DESTDIR="${pkgdir}" install
}
