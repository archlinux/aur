# Maintainer: Leonard Iklé <leonard.ikle at gmail dot com>
pkgname=libhydrogen-git
pkgver=r335.0d42243
pkgrel=1
pkgdesc="A lightweight, secure, easy-to-use crypto library suitable for constrained environments."
arch=('x86_64')
url="https://github.com/jedisct1/libhydrogen"
license=('custom:ISC')
makedepends=('git' 'cmake')
provides=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/jedisct1/libhydrogen.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -S "$srcdir/${pkgname%-git}" -B build \
    -DCMAKE_BUILD_TYPE="None" \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -Wno-dev
  cmake --build build
}

check() {
	cd build
	ctest
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
