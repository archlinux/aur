# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-easybox
pkgver=0.1.3
pkgrel=1
pkgdesc="Emilua-easybox"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/easybox"
license=('MIT-0')
depends=('emilua')
makedepends=('git' 'meson' 'boost')
source=("${pkgname}::git+https://gitlab.com/emilua/easybox.git#tag=v${pkgver}"
	"kafel::git+https://github.com/google/kafel.git#tag=20231004"
	"kafel-patch.zip::https://wrapdb.mesonbuild.com/v2/kafel_20231004-1/get_patch")
md5sums=('SKIP'
	 'SKIP'
	 'ad016cca554ea68149ffc811f39c295e')

prepare() {
    cd "${srcdir}/kafel"
    cp "${srcdir}/kafel-20231004/meson.build" "."

    cd "${srcdir}/${pkgname}/subprojects"
    ln -s "${srcdir}/kafel" "kafel-20231004"
}

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
