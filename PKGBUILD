# Maintainer: Josesk Volpe <joseskvolpe at gmail dot com>
#Contributor: yochananmarqos <mark dot wagie at tutanota dot com>

pkgname=winegui
pkgver=1.5.4
pkgrel=1
pkgdesc="A user-friendly WINE manager (build from source)"
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
sha256sums=('1dfaf401243acb3685269c0b9109975e6058dfac9adc633e53140bdfc2da528d')

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
