# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=libjodycode
pkgver=1.0
pkgrel=1
pkgdesc='Shared code used by several utilities written by Jody Bruchon'
arch=(i686 x86_64)
url=https://github.com/jbruchon/libjodycode
license=(MIT)
depends=(glibc)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
		$pkgname-fix-make-install.patch::https://github.com/jbruchon/libjodycode/commit/1655163b273baac6e02f6b3404e4fcbb14ab763d.patch)
sha256sums=('3849c7a76c46687eafcff8db37477ce31662ac7a0d88cbd7495755b0f9859280'
            'dbae9995c2b22b5aa5ff14877d0960df3e608e5915b347acef5f4c2cda033f03')

prepare() {
	patch --directory="$pkgname-$pkgver" --forward --strip=1 --input="${srcdir}/$pkgname-fix-make-install.patch"
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
