# Maintainer: Danil Kondratiev <knightpp@protonmail.com>
pkgname=flowy-git
pkgver=0.3.2.r1.ce22ef8
pkgrel=1
pkgdesc="Dynamic desktop wallpaper changer"
arch=('any')
url="https://github.com/vineetred/flowy"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git' 'cargo')
source=("$pkgname::git+https://github.com/vineetred/flowy.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	printf "%s" "$(git describe --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "${srcdir}/${pkgname}"
	cargo build --release --bin flowy
}

# check() {
# 	cd "${pkgname}"
# 	cargo test
# }

package() {
	cd "${srcdir}/${pkgname}/target/release/"
	strip "./flowy"
	install -Dm755 "./flowy" "${pkgdir}/usr/bin/flowy"
}
