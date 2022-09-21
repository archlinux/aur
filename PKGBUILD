# Maintainer: Kusoneko <kusoneko@kusoneko.moe>

pkgname=libretls-git
pkgver=3.5.2.r65.d1db6f6
pkgrel=1
pkgdesc="libtls for OpenSSL"
arch=('x86_64')
url="https://git.causal.agency/libretls"
license=('BSD' 'ISC' 'MIT')
depends=('openssl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://git.causal.agency/${pkgname%-git}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "%s.r%s.%s" "$(git describe --tags --abbrev=0)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	autoreconf -fi
	./configure --prefix=/usr
	make all
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
