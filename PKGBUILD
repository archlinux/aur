# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
# Co-Maintainer: Melroy van den Berg <melroy at melroy dot org>
# Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=2.8.1
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
sha256sums=('61b732379875c70e4d47f214409854fae6ff943a38207feabfa94ceabaa4a275')

build() {
	cmake -GNinja -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -B build_prod
	cmake --build ./build_prod --config Release
}

package() {
	DESTDIR="$pkgdir" cmake --install build_prod
}
