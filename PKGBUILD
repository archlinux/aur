# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
# Co-Maintainer: Melroy van den Berg <melroy at melroy dot org>
# Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=2.6.4
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface (build from source)"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'cabextract'
	'gtkmm3'
	'p7zip'
	'unzip'
	'wget'
	'wine'
	# namcap claims some dependencies aren't needed, but they're infact used on the source-code as a terminal command
)
optdepends=(
	'ccache: Speeds up rebuilds'
	'graphviz'
)
makedepends=(
	'cmake'
	'git'
	'json-glib'
	'ninja'
)
source=("https://winegui.melroy.org/downloads/WineGUI-Source-v$pkgver.tar.gz")
sha256sums=('88d3fa7b4c1f314d45638ff4faa02a19396486348686be6310db05b20a7aa679')

build() {
	cmake -GNinja -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -B build_prod
	cmake --build ./build_prod --config Release
}

package() {
	DESTDIR="$pkgdir" cmake --install build_prod
}
