# Maintainer: Vinícius dos Santos Oliveira <vini.ipsmaker@gmail.com>
pkgname=emilua-epoll
provides=(emilua)
conflicts=(emilua)
pkgver=0.11.7
pkgrel=2
pkgdesc="Lua execution engine"
arch=('i686' 'x86_64')
url="https://gitlab.com/emilua/emilua"
license=('boost')
depends=('luajit' 'boost-libs' 'fmt' 'openssl' 'ncurses' 'serd' 'sord' 'libcap')
makedepends=('git' 'meson' 'boost' 'cereal' 're2c' 'gawk' 'gperf' 'asciidoctor')
source=("emilua::git+https://gitlab.com/emilua/emilua.git#tag=v${pkgver}")
md5sums=('SKIP')
#validpgpkeys=()

build() {
	arch-meson emilua build \
		   -D version_suffix=-arch${pkgrel} \
		   -D enable_file_io=false \
		   -D enable_io_uring=false
	meson compile -C build
}

check() {
	meson test --print-errorlogs -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
