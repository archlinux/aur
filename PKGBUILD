# Maintainer: Sam Whited <sam@samwhited.com>

# There are no tags on this package, so we're just downloading the latest
# commit that is marked as version 2.0.0 in version.c:
# https://github.com/Syndace/libxeddsa/blob/d725c816bb26483ac397ce0d19de5ad2972955f1/src/version.c
_commit=d725c816bb26483ac397ce0d19de5ad2972955f1
pkgname=libxeddsa
pkgver=2.0.0
pkgrel=1
pkgdesc='A toolkit around Curve25519 and Ed25519 key pairs.'
url="https://github.com/Syndace/${pkgname}"
license=('MIT')
arch=('x86_64')
makedepends=('git' 'cmake' 'libsodium')
source=("${pkgname}.zip::https://github.com/Syndace/libxeddsa/archive/${_commit}.zip")
sha256sums=('889053901097f497846f1043fd1d9f3a2018047ed96f1d29c1928180e47fe377')
depends=('glibc')

prepare() {
	cd ${pkgname}-${_commit}
	cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

build() {
	cd ${pkgname}-${_commit}
	make
}

package() {
	cd ${pkgname}-${_commit}
	make DESTDIR="$pkgdir" install
}
