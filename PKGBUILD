# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-protocol
pkgver=1.0.3
pkgrel=1
pkgdesc="Emilua bindings for Bjørn Reese's Protocol (JSON) library"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/protocol"
license=('boost')
depends=('emilua')
makedepends=('git' 'meson' 'boost' 'gawk' 'gperf' 'asciidoctor')
source=("${pkgname}::git+https://gitlab.com/emilua/protocol.git#tag=v${pkgver}"
	"trial-protocol::git+https://github.com/breese/trial.protocol.git#commit=79149f604a49b8dfec57857ca28aaf508069b669")
md5sums=('SKIP'
	 'SKIP')

prepare() {
	cd "${srcdir}/${pkgname}/subprojects"
	ln -s "${srcdir}/trial-protocol" .
	cp "packagefiles/trial.protocol/meson.build" "trial-protocol/"
}

build() {
	arch-meson "${pkgname}" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir/" meson install -C build
}
