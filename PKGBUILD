# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
pkgname=dav2d
pkgver=0.0.1
pkgrel=1
pkgdesc="dav2d is an AV2 cross-platform decoder"
arch=('x86_64')
url="https://code.videolan.org/videolan/dav2d"
license=('BSD-2-Clause')
depends=('glibc')
makedepends=('meson' 'ninja' 'nasm')
source=("dav2d-${pkgver}.tar.gz::$url/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz?ref_type=tags")
noextract=()
sha256sums=('1b0874984cb29b96f59c8b24f109a5707e4917d2e7d45d57d482ae0473d8c627')
validpgpkeys=()

prepare() {
	cd "${srcdir}/"
	#meson subprojects download --sourcedir=${pkgname}-${pkgver} #check currently fails
}

build() {
	cd "${srcdir}"
	arch-meson build "${pkgname}-${pkgver}"
	meson compile -C build
}

check() {
	cd "${srcdir}"
	#meson test -C build check currently fails to compile
}

package() {
	cd "${srcdir}"
	meson install -C build --destdir "$pkgdir"
	install -Dm644 ${pkgname}-${pkgver}/COPYING "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
