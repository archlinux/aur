# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=freac_cdk
_realpkgver=20170317
pkgver=cvs_${_realpkgver}
pkgrel=1
pkgdesc="Component development kit for freac."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('smooth' 'libcdio-paranoia' 'cdparanoia' 'libxspf' 'alsa-lib')
source=("https://downloads.sourceforge.net/project/bonkenc/snapshots/${_realpkgver}/cdk/${pkgname/_/-}-${_realpkgver}.tar.gz" "disable-coreaudio.patch")
sha512sums=('839abd563a537ddfff43250b30e8692bcffc66ffc72a022c17eb86d60f09ea36260008b95f592c7a5ad615c8af37f54f569d94da8d89707ba87e50479e9736c3'
            '14fe0fdc47ef6521a672c66d611c8497cd9d57e50b69aad9f9560a472016aaf549f9c73a147c6e935f4f3110b96d3b2e87d3168c0f06f391c8cd6a6004e8d5f3')

prepare() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	patch -p1 -i "$srcdir/disable-coreaudio.patch"
	find . -type f -exec sed -i 's!/usr/local!/usr!g' {} \;
}

build() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	make config=systemlibxspf
}

package() {
	cd "${pkgname/_/-}-${_realpkgver}" || exit 1
	make DESTDIR="$pkgdir/" install
}
