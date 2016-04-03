# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=libbrotli-git
pkgver=r38.1606131
pkgrel=2
pkgdesc="meta project to build libraries from the brotli source code"
arch=('x86_64' 'i686')
url="https://github.com/bagder/libbrotli"
license=('MIT')
makedepends=('git')
depends=('brotli')
provides=('libbrotli')
source=("$pkgname"::'git+https://github.com/bagder/libbrotli.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir/${pkgname}"
	make DESTDIR="$pkgdir/" install
}
