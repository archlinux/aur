# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
#Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=1.9.2
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
sha256sums=('9aacf396617d76561b869a80217d6eb2e41d4a8c9e59416338921e2ba503c840')

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
