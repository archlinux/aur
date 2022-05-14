# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcc
pkgver=0.0.4
pkgrel=1
pkgdesc='The Witchcraft Compiler Collection'
url=https://github.com/endrazine/wcc
arch=(i686 x86_64)
license=(custom:MIT)
depends=(capstone glibc binutils zlib libelf linenoise lua53)
makedepends=(git make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        wsh-system-libs.patch)
b2sums=('b08196fd15657c896cac6cfa309efd082471fdb87b8146b0ee17d686c09c6246e35aae843a979fdb732fc1083b635faeba89e0d124764083fc8335043417c75a'
        '18ae4ddf34ebf3d290183c41fe93d899a35d1330addff8ca9ae2be894164ba28d405fcf1eb47930355fd49065e12f3941a7cec9c8b2cb68c4cc22e29aa2dbb4e')

prepare () {
	cd "${pkgname}-${pkgver}"
	patch -p0 < "${srcdir}/wsh-system-libs.patch"
}

build () {
	cd "${pkgname}-${pkgver}"
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	mkdir -p "${pkgdir}/usr/bin"
	make DESTDIR="${pkgdir}/" install

	install -Dm644 -t "${pkgdir}/usr/share/man/man1" doc/manpages/*.1
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
