# Contributor: gilzoide <gilzoide at gmail dot com>

pkgname=pega-texto-git
pkgver=r161.4a59b9a
pkgrel=1
pkgdesc="A runtime engine for Parsing Expression Grammars (PEG) in C"
arch=('any')
url="https://github.com/gilzoide/pega-texto"
license=('Unlicense')
makedepends=('git' 'cmake')
source=("$pkgname"::"git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build -S "$pkgname" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
