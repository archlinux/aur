# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Federico Di Pierro <nierro92@gmail.com>
# Contributor: Nathan Owens <ndowens @ artixlinux.org
pkgname=('libulfius' 'uwsc')
pkgbase=libulfius
_gitname=ulfius
pkgver=2.7.1
pkgrel=1
arch=('x86_64')
url="http://babelouest.github.io/ulfius"
license=('LGPL2.1')
depends=('libmicrohttpd' 'jansson' 'curl' 'gnutls' 'libgcrypt' 'libyder')
makedepends=('git' 'cmake')
source=("$_gitname-$pkgver.tar.gz::https://github.com/babelouest/ulfius/archive/v$pkgver.tar.gz")
sha256sums=('d5dfb90ac16fe9d8ce70fe6b23e43102d5208d4f0174196d3ef183d950d3a57b')

build() {
	cmake -B build -S "$_gitname-$pkgver" \
		-G "Unix Makefiles" \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package_libulfius() {
	pkgdesc="Web Framework for REST Applications in C"
	provides=('libulfius.so=2.7')

	make -C build DESTDIR="$pkgdir" install

	rm -rf "$pkgdir"/usr/{bin,share/man}
}

package_uwsc() {
	pkgdesc="Ulfius WebSocket Client"
	depends=('libulfius')

	make -C build DESTDIR="$pkgdir" install

	rm -rf "$pkgdir"/usr/{include,lib,share/doc}
}
