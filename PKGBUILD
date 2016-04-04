# Maintainer: Adam Ehlers Nyholm Thomsen<adament@adament.net>
pkgname=davix
pkgver=0.6.0
_pkgver="R_${pkgver//./_}"
pkgrel=1
pkgdesc="A client for data and file management over the WebDav, Amazon S3, Microsoft Azure and HTTP protocols."
arch=('i686' 'x86_64')
url="https://dmc.web.cern.ch/projects/davix/home"
license=('LGPL2.1')
depends=('openssl' 'libxml2' 'boost-libs')
makedepends=('doxygen' 'boost' 'cmake')
checkdepends=('gtest')
optdepends=()
conflicts=(davix-git)
source=("https://github.com/cern-it-sdc-id/$pkgname/archive/${_pkgver//./_}.tar.gz")
sha256sums=('81079dc9f5c4ad7d3770e809041a646abfbec0c506b05e01cc98f075f38d3b04')

build() {
	cd "$pkgname-$_pkgver"
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
	cd "$pkgname-$_pkgver"
	make DESTDIR="$pkgdir/" install
}
