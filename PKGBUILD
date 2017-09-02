# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=freac_cdk
_date=20170902
pkgver=1.1alpha_${_date}
pkgrel=1
pkgdesc="Component development kit for freac."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('smooth>=0.8.73.0_pre4' 'libcdio-paranoia' 'cdparanoia' 'libxspf' 'alsa-lib')
source=("https://downloads.sourceforge.net/project/bonkenc/snapshots/${_date}/cdk/${pkgname/_/-}-1.1-alpha-${_date}.tar.gz" "disable-coreaudio.patch")
sha512sums=('06ca241ed3843be8ded7322267d58496c5642fe46b9149193e7d6fcca3bddcc6618d00e063092ab1425a73c29afc053a06ce2927d3be3e560f9ddc0ed7701f91'
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
