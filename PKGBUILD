# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libofa
pkgver=0.9.3
pkgrel=3
pkgdesc="An open-source audio fingerprint by MusicIP"
arch=('i686' 'x86_64')
url="http://code.google.com/p/musicip-libofa/"
license=('GPL2' 'custom')
depends=('expat' 'curl' 'fftw' 'gcc-libs')
makedepends=('pkgconfig')
options=('!libtool')
source=("http://musicip-libofa.googlecode.com/files/$pkgname-$pkgver.tar.gz"
	    'gcc-4.patch'
	    'gcc4.3.patch'
	    'gcc4.5.patch')
sha1sums=('3dec8e1dcea937f74b4165e9ffd4d4f355e4594a'
          'cb19377d0634c03d2a49cfc61915cec918c341f7'
          'cae08bdc12de923d5e032696702a0530ae6eafc1'
          '754d69d66ab46219035ccafeeb3ff62433cca4f2')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p0 -i ${srcdir}/gcc-4.patch
  patch -p1 -i ${srcdir}/gcc4.3.patch
  patch -p1 -i ${srcdir}/gcc4.5.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
