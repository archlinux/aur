# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=4.1
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://codeberg.org/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
		"${url}/commit/07294bbfd6c3c4be42c40c9ed81eebb5cd3d83a0.patch")
sha256sums=('24ab610b81fbd783874b4c6fbedeed52436b0d0aba293d91b9e678c431b092fe'
            'a9ed883dce6eeb90b20ea851247696b1b9a6f1cfbf8579cf9885ac0e3349e0d1')

prepare() {
	patch --directory="${pkgname}" --forward --strip=1 --input="${srcdir}/07294bbfd6c3c4be42c40c9ed81eebb5cd3d83a0.patch"
}

build() {
	cd "${pkgname}"
	make
}

package() {
	cd "${pkgname}"
	make PREFIX="/usr" DESTDIR="${pkgdir}" install
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.txt
}
