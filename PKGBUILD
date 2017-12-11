# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=freac_cdk
_date=20171119
pkgver=1.1alpha_${_date}
pkgrel=3
pkgdesc="Component development kit for freac."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('smooth>=0.8.73.0' 'libcdio-paranoia' 'cdparanoia' 'libxspf' 'alsa-lib')
source=("https://downloads.sourceforge.net/project/bonkenc/snapshots/${_date}/cdk/${pkgname/_/-}-1.1-alpha-${_date}.tar.gz" "disable-coreaudio.patch")
sha512sums=('e2f53d54a8783e31f223317cdae617a2a33bac48be3b65e6aca4a0aaebd0f5d38174fe397624cd00ccfc37aa186c37eeb421dd57257adbae01373dd33212d202'
            'ddde1481f56617a06f1d9f337bf9d6a6cee16f36333a66dd24830da33756c7477b1e1768fce29ac481aad08cc6c8629e305ee7b30466667ea35e55a0bae69562')

prepare() {
	cd "${pkgname/_/-}-1.1-alpha-${_date}" || exit 1
	patch -p1 -i "$srcdir/disable-coreaudio.patch"
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "${pkgname/_/-}-1.1-alpha-${_date}" || exit 1
	make config=systemlibxspf
}

package() {
	cd "${pkgname/_/-}-1.1-alpha-${_date}" || exit 1
	make DESTDIR="$pkgdir/" install
}
