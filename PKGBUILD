# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
# Co-Maintainer: Melroy van den Berg <melroy at melroy dot org>
# Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=4.1.0
pkgrel=1
pkgdesc="A user-friendly WINE graphical interface (build from source)"
arch=('x86_64')
url="https://gitlab.melroy.org/melroy/winegui"
license=('AGPL3')
depends=(
	'cabextract' # used by winetricks
	'gtkmm-4.0'
	'p7zip'
	'unzip'
	'wget' # to download winetricks/Wine runner latest release
	'wine'
	'zenity' # used by winetricks
	'tar' # used to untar Wine runenr downloads
	'xz' # used to untar/xz/lzma Wine runner downloads
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
sha256sums=('d248d9d61ec9a3474a08ab40548031d93bf19147c9a281a98ddf30f406f65dff')

build() {
	cmake -GNinja -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE=Release -DCHECK_FOR_UPDATE=OFF -DGSETTINGS_COMPILE:BOOL=FALSE -B build_prod
	cmake --build ./build_prod --config Release
}

package() {
	DESTDIR="$pkgdir" cmake --install build_prod
}
