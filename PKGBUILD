# Maintainer:  Marcin Wieczorek <marcin@marcin.co>
# Contributor: Adam Ehlers Nyholm Thomsen<adament@adament.net>

pkgname=davix
pkgver=0.8.4
_pkgver="R_${pkgver//./_}"
pkgrel=1
pkgdesc="A client for data and file management over the WebDav, Amazon S3, Microsoft Azure and HTTP protocols."
arch=('i686' 'x86_64')
url="https://github.com/cern-fts/davix"
license=('LGPL2.1')
depends=('openssl' 'libxml2' 'boost-libs' 'util-linux-libs')
makedepends=('doxygen' 'boost' 'cmake')
checkdepends=('gtest')
optdepends=()
conflicts=(davix-git)
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/${_pkgver}/davix-${pkgver}.tar.gz")
sha256sums=('519d56f746e86ea3fd615bc49e559b520df07e051e1ca3d8c092067958f3b2b7')

build() {
	cd "${pkgname}-${pkgver}"
	cmake -DLIB_SUFFIX="" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release .
	make
	make doc
}

#check() {
#	cd "$pkgname-$_pkgver"
#	cmake . -DUNIT_TESTS=TRUE
#	make
#	make test
#}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
