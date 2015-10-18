# Maintainer: Michael Gwin <oksijun+arch at gmail dot com>
# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=museeq-git
pkgver=20150216
pkgrel=2
pkgdesc="A Qt4 interface to the museekd daemon."
url="http://www.museek-plus.org/"
depends=('qt4')
makedepends=('git' 'cmake')
license=('GPL2')
arch=('i686' 'x86_64')
conflicts=('museeq' 'museekplus-svn' 'museek-plus' 'museeq-svn')
provides=('museeq')
replaces=('museeq-svn')
source=("${pkgname}::git+https://github.com/eLvErDe/museek-plus")
md5sums=('SKIP')

pkgver() {
    cd ${srcdir}/${pkgname}
    git log -1 --format="%cd" --date=short | tr -d '-'
}

build() {
    mkdir -p ${srcdir}/${pkgname}/build
    cd ${srcdir}/${pkgname}/build

	cmake -DNO_MUSEEKD=1 -DNO_MUSCAN=1 -DNO_SETUP=1 -DNO_PYMUCIPHER=1 \
        -DPREFIX=/usr -DMANDIR=/usr/share -DQT_QMAKE_EXECUTABLE=qmake-qt4 ${srcdir}/${pkgname}
	make
}

package() {
    cd ${srcdir}/${pkgname}/build
	make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
