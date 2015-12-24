# Maintainer: sauyon <sauyonl@sauyon.com>
# Contributor: Yukarin <yukariin@yandex.ru>

pkgname='kancolletool'
pkgver=0.9.6
pkgrel=1
epoch=
pkgdesc="Makes KanColle better"
arch=('i686' 'x86_64')
url="http://kancolletool.github.io/"
license=('MIT')
groups=()
depends=('flashplugin')
makedepends=('qt5-base' 'qt5-webkit' 'git' 'cmake')
checkdepends=()
optdepends=()
provides=()
conflicts=('kancolletool-viewer-git')
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git://github.com/KanColleTool/KanColleTool.git#tag=v$pkgver")
md5sums=('SKIP')
noextract=()

pkgver() {
	cd "$srcdir/$pkgname"
	cat VERSION
}

prepare() {
	cd "$srcdir/$pkgname"
	git submodule update --init --recursive tool viewer
}

build() {
	cd "$srcdir/$pkgname"
	cmake -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" .
	make
}

package() {
	cd "$srcdir/$pkgname"
	make install
	install -Dm644 ./tool/resources/kancolletool.desktop "$pkgdir/usr/share/applications/kancolletool.desktop"
	install -Dm644 ./viewer/resources/kancolletool-viewer.desktop "$pkgdir/usr/share/applications/kancolletool-viewer.desktop"
	install -Dm644 ./tool/resources/kancolletool.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/kancolletool.png"
	install -Dm644 ./viewer/resources/kancolletool-viewer.png "$pkgdir/usr/share/icons/hicolor/192x192/apps/kancolletool-viewer.png"
}
