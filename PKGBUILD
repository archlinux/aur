# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=1.3
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://github.com/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
		libjodycode-fix-grep-in-make.patch::https://github.com/jbruchon/libjodycode/commit/bd724ba6862b1698472e224e64bb8009190985b3.patch
		libjodycode-fix-version-grep.patch::https://github.com/jbruchon/libjodycode/commit/b0f531c51eec87381ce13d9bf9d302c78a2e6329.patch)
sha256sums=('808160e9b43bfc1a986c313d5999bc367eab173ca7079a1408a0aa1b0cde78d6'
            '78cae4f2f378401177d3f94456970a4fb30c6fa65588204ab0d59c77949816f1'
            '01762add4575e3f991283f988f1ec1715b5fc9f01be1783835a7a8b99d0c7680')

prepare() {
	patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/$pkgname-fix-grep-in-make.patch"
	patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/$pkgname-fix-version-grep.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
