# Maintainer: madmurphy <madmurphy333 AT gmail DOT com>
# Contributor: Princeton Ferro <princetonferro AT gmail DOT com>
# Contributor: PedroHLC <root AT pedrohlc DOT com>

pkgname='notejot'
pkgver='3.5.1'
pkgrel=1
pkgdesc='A stupidly-simple sticky notes application for any type of short term notes or ideas'
arch=('i686' 'x86_64')
url='https://github.com/lainsce/notejot'
license=('GPL')
depends=('gtk4' 'gtksourceview3' 'json-glib' 'libgee' 'libadwaita')
makedepends=('meson' 'vala')
conflicts=('notejot-git')
source=("https://github.com/lainsce/${pkgname}/archive/${pkgver}.tar.gz"
        'simplify-bool.patch')
sha256sums=('09fc420322646976594aba1c4d02a01e47d241f196d1c2a519553ad034784213'
            '70c97e07951810146bf20ce1f5e2570012aa244df0491e11278edb9f6199c236')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	# https://github.com/lainsce/notejot/issues/395
	patch -Np1 -i ../simplify-bool.patch
}

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	meson build
	cd build
	meson configure -Dprefix=/usr
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}


