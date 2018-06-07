# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>
pkgname=magico
pkgver=0.1
pkgrel=1
pkgdesc="A minimalist AUR Helper"
arch=('x86_64')
url="https://github.com/archlinux-br-dev/magico"
license=('GPL')
depends=('jq')
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('dd892dbc6420efb9038677bea1fae907')

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
