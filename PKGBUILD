# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Rémy Oudompheng <oudomphe@clipper.ens.fr>

pkgname=lib32-libspiro
_pkgbase=libspiro
pkgver=20190731
pkgrel=1
pkgdesc='Simplifies the drawing of beautiful curves (32-bit)'
url="https://github.com/fontforge/libspiro"
license=('GPL')
arch=('x86_64')
depends=('libspiro')
source=("https://github.com/fontforge/${_pkgbase}/releases/download/${pkgver}/${_pkgbase}-${pkgver}.tar.gz")
sha256sums=('24c7d1ccc7c7fe44ff10c376aa9f96e20e505f417ee72b63dc91a9b34eeac354')

prepare() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

	cd "${srcdir}/${_pkgbase}-${pkgver}"
	autoreconf -i
	automake --foreign -Wall
}

build() {
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export CFLAGS="-m32"
  export CXXFLAGS="-m32"

	cd "${srcdir}/${_pkgbase}-${pkgver}"
	export LDFLAGS=
	./configure --prefix=/usr --libdir=/usr/lib32
	make
}

package() {
	cd "${srcdir}/${_pkgbase}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -Dm644 libspiro.pc "${pkgdir}/usr/lib32/pkgconfig/libspiro.pc"
  rm -r "${pkgdir}/usr/include"
}

