# Maintainer: Mark E.A. <evalapply ``dot'' aur ``at'' airmail ``dot'' cc>
# Contributor: nandub <dev@nandub.info>
# Contributor: plmday

pkgname=io-git
pkgver=20151111.11.g457b5ff
pkgrel=1
pkgdesc="Io is a prototype-based programming language inspired by Smalltalk"
arch=('i686' 'x86_64')
url="http://www.iolanguage.com/"
license=('BSD')
depends=('pcre' 'libsndfile' 'libxmu' 'freetype2' 'libedit' 'libxml2'
	'libtiff' 'libevent' 'yajl' 'libmysqlclient' 'lzo' 'libpng'
	'python2' 'util-linux' 'freeglut' 'libjpeg-turbo' 'libtheora')
makedepends=('git' 'cmake')
provides=('io')
conflicts=('io')
source=('git+https://github.com/stevedekorte/io.git')
sha256sums=('SKIP')

pkgver() {
	cd io
	git describe | sed -e 's|\.||g' -e 's|-|.|g'
}

build() {
	cd io
	sed -ri "s|20[0-9]+|$pkgver|" libs/iovm/source/IoVersion.h

	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr ..
	make -j1
}

package() {
	cd io
	make -C build DESTDIR="$pkgdir" install
	install -Dm644 license/bsd_license.txt \
	"$pkgdir/usr/share/licenses/$pkgname/bsd_license.txt"
}
