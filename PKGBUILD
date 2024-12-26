# Maintainer: Adrian Perez de Castro <aperez@igalia.com>
pkgname=wcc
pkgver=0.0.7
pkgrel=1
pkgdesc='The Witchcraft Compiler Collection'
url=https://github.com/endrazine/wcc
arch=(i686 x86_64)
license=(MIT)
depends=(capstone glibc binutils zlib libelf linenoise lua53)
makedepends=(git make)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        wsh-system-libs.patch)
b2sums=('e87aec301334bc3d0d776210948614f164aee06732b67a1b55cd0d002ead353d22640f99003e03da104efe11843297e9b8b1a5b37cd9b1b636febf1f7b751ca4'
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
}
