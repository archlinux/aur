# Maintainer: Raimar Bühmann <raimar _at_ buehmann _dot_ de>
# This PKGBUILD is based on poco to provide also the basic version of
# https://aur.archlinux.org/packages/poco/

pkgname=libpoco-basic
pkgver=1.15.3
_subrel=
pkgrel=1
pkgdesc="C++ class libraries for network-centric, portable applications, basic edition"
arch=('i686' 'x86_64')
url="http://www.pocoproject.org"
license=('custom:boost')
depends=('pcre' 'expat' 'libutf8proc')
conflicts=('poco' 'poco-devel' 'poco-git')
makedepends=('gcc' 'cmake')
source=(
	${url}/releases/poco-${pkgver}/poco-${pkgver}${_subrel}.tar.gz
#	RegularExpression.h.patch
)
sha256sums=('19a2811deaaf4b0bb6d9f45b74257b5ca381d8dec5a804b9a8b7e8636d7a29de')
prepare() {
	# apply patch for static build
	cd poco-${pkgver}${_subrel}
#	patch Foundation/include/Poco/RegularExpression.h < ../RegularExpression.h.patch
}

build() {
	cd poco-${pkgver}${_subrel}
	cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DPOCO_UNBUNDLED=ON -B build
	cmake --build build
}

package() {
	cd poco-${pkgver}${_subrel}
	DESTDIR="$pkgdir" cmake --install build --prefix /usr
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

