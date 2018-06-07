# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=magico
pkgver=VERSION
pkgrel=1
pkgdesc="A minimalist AUR Helper"
arch=('x86_64')
url="https://github.com/archlinux-br-dev/magico"
license=('GPL')
depends=('jq')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
md5sums=()

pkgver() {
	cd "$srcdir/${pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
