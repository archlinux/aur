# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
#Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=2.4.1
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
	'doxygen'
)
source=("https://gitlab.melroy.org/melroy/winegui/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('857d2f8d2979fefaa72178f539e29b6e41787ea92147046f922e7b051855444d')

build() {
	cd "$pkgname-v$pkgver"
	cmake -GNinja -DCMAKE_INSTALL_PREFIX:PATH=/usr -Ddoc=ON -Dpackage=ON -DCUSTOM_PROJECT_VERSION=$pkgver -DCMAKE_BUILD_TYPE=Release -B build_prod
	cmake --build ./build_prod --config Release

}

package() {
	cd "$pkgname-v$pkgver"
	DESTDIR="$pkgdir" cmake --install build_prod
}
