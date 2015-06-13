# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gilles CHAUVIN <gcnweb ][ gmail ? com>
# Contributor: Jonathan Schaeffer <joschaeffer ][ gmail ? com>
# Contributor: chfoxli <lg ][ romandie ? com>
# Maintainer: SanskritFritz (gmail)

pkgname=kphotoalbum-git
_gitname="kphotoalbum"
pkgver=2013.10.11
pkgrel=1
epoch=1
pkgdesc="KDE Photo Album, picture collection manager - latest git version."
url="http://www.kphotoalbum.org/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('kdebase-runtime' 'libkipi' 'libkexiv2' 'libkdcraw')
makedepends=('cmake' 'automoc4' 'kdeedu-marble' 'kdemultimedia-mplayerthumbs' 'git')
optdepends=('kdeedu-marble: integration with Marble'
	'kipi-plugins: add extra functionality'
	'kdemultimedia-mplayerthumbs: video thumbnails')
install=kphotoalbum.install
provides=('kphotoalbum')
conflicts=('kphotoalbum')
source=("$_gitname::git://anongit.kde.org/kphotoalbum.git")
md5sums=('SKIP')

pkgver() {
	cd "$_gitname"
	git log -1 --format="%cd" --date=short | sed 's|-|.|g'
}

build() {
	cd "$srcdir/$_gitname"
	cmake 	-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DQT_QMAKE_EXECUTABLE=qmake4 \
		.
	make
}

package() {
	cd "$srcdir/$_gitname"
	make DESTDIR=${pkgdir} install
}
