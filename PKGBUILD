# Maintainer: Carlos Eduardo <carana2099@gmail.com>
pkgname=xchpst
pkgver=0.6.2
pkgrel=1
epoch=
pkgdesc="A backwards-compatible chpst implementation with new hardening options using namespaces and capabilities"
arch=(x86_64)
url="https://gitlab.com/init-tools/xchpst"
license=('MIT')
groups=()
depends=(libcap)
makedepends=('make')
source=("https://gitlab.com/init-tools/xchpst/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2"
        "symlink-fix.patch::https://gitlab.com/init-tools/xchpst/-/commit/f9441286f2a39f03ecfc2e9fdc7740122dd759a2.patch")
noextract=()
sha256sums=('e955562197d0ef6483c153db4fa561207628ef12ca5bca4e1786af2a833acf85'
            'c1e5d7703592011bc92ce0b499288521164028c3461190db8dec2c19ddb9a7ce')
validpgpkeys=()

prepare() {
	cd "$pkgname-v$pkgver"

	sed -i 's/ln -f/ln -sf/' Makefile
	patch -p1 -i "$srcdir/symlink-fix.patch"
}

build() {
	cd "$pkgname-v$pkgver"
	make
}

package_xchpst() {
	cd "$pkgname-v$pkgver"
	make prefix=/usr DESTDIR="$pkgdir/" install
}
