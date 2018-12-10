# Maintainer: Drew DeVault <sir@cmpwn.com>
pkgname=koio
pkgver=0.1.1
pkgrel=1
license=('MIT')
pkgdesc='tool & small library for embedding files in C programs'
arch=("any")
url='https://git.sr.ht/~sircmpwn/koio/'
source=("https://git.sr.ht/~sircmpwn/$pkgname/archive/$pkgver.tar.gz")
sha512sums=('0b3a22c3deb4f7591748b60ffecfca6ca7b63cd9e914d34a537cc1f7a0ba5ea887c9bdec62558dbe29b3c553d75936781e6afc5d3a0252aab8cbcc521f1f9602')
makedepends=('meson' 'ninja')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	rm -rf "$srcdir"/build
	meson --prefix=/usr "$srcdir"/build
	ninja -C "$srcdir"/build
}

package() {
	cd "${srcdir}"/build
	DESTDIR="$pkgdir" ninja install
}
