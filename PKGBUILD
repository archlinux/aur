# Contributor: birdflesh <antkoul at gmail dot com>
# Maintainer: SanskritFritz (gmail)

pkgname=mangonel-git
_gitname="Mangonel"
pkgver=2012.12.12
pkgrel=1
epoch=1
pkgdesc="Simple but fast application launcher."
arch=('i686' 'x86_64')
url=http://www.tarmack.eu/mangonel.html
license=('Apache 2.0')
depends=()
makedepends=('git' 'automoc4')
provides=('mangonel')
conflicts=('mangonel')
source=("git://github.com/tarmack/Mangonel.git")
md5sums=('SKIP')

pkgver() {
        cd "$_gitname"
        git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	cmake . -DQT_QMAKE_EXECUTABLE=qmake-qt4 -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR="$pkgdir" install
}

