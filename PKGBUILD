# Maintainer: Max Bruckner <max at maxbruckner dot de>
pkgname=freac_cdk
_realpkgver=20170729
pkgver=cvs_${_realpkgver}
pkgrel=1
pkgdesc="Component development kit for freac."
arch=('i686' 'x86_64')
url="http://www.freac.org/"
license=('GPL2')
depends=('smooth>=0.8.73.0_pre3' 'libcdio-paranoia' 'cdparanoia' 'libxspf' 'alsa-lib')
source=("https://downloads.sourceforge.net/project/bonkenc/snapshots/${_realpkgver}/cdk/${pkgname/_/-}-${_realpkgver}.tar.gz" "disable-coreaudio.patch")
sha512sums=('6fd1f01daea2a7451dfa6aacd8a2ade0f03ce68a51e49dbb0d8046ba841a29f265a05651cdb716117a6b4716474a60c098b892689a3515941f7515f1701bd5ab'
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
