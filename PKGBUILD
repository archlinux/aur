# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
#Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=2.1.0
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
makedepends=(
	'cmake'
	'git'
)
source=("https://gitlab.melroy.org/melroy/winegui/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('33ca58d0c87540c664c5c7d32451eae1e570a006a99111749cf15d6deef5b6f0')

prepare(){
	sed -i "s/\${GIT_TAG_VERSION}/$pkgver/g" winegui-v$pkgver/CMakeLists.txt
}

build() {
  cmake -B build -S "$pkgname-v$pkgver" \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
