# Maintainer: yehuthi <yehuthith@gmail.com>
pkgname=linuxflip-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Detects and executes commands when the computer switches to and from tablet mode."
url="https://github.com/yehuthi/linuxflip"
arch=('i686' 'x86_64')
makedepends=('git' 'cmake')
source=("repo::git+$url")
sha256sums=("SKIP")

pkgver() {
	git --git-dir="$srcdir/repo/.git" describe --tags --abbrev=0 | cut -c 2-
}

build() {
	mkdir "$srcdir/repo/build" && cd $_
	cmake                             \
		-DCMAKE_BUILD_TYPE=None       \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-Wno-dev                      \
		..
	cmake --build .
}

package() {
	DESTDIR="$pkgdir" cmake --install "$srcdir/repo/build"
}

