# Maintainer: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=libofa
pkgver=0.9.3
pkgrel=8
pkgdesc="An open-source audio fingerprint by MusicIP"
arch=('x86_64')
url="https://github.com/tanob/libofa"
license=('GPL2' 'custom')
depends=('expat' 'curl' 'fftw')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/musicip-libofa/libofa-$pkgver.tar.gz"
        'libofa-gcc4.patch'
        'libofa-gcc4.3.patch'
        'libofa-gcc4.5.patch'
        'libofa-0.9.3-curl-7.21.patch'
	'libofa-0.9.3-gcc-4.7.patch')
sha256sums=('0216466153e92058c5202dea03390ddc7601d916b983f71ce4f4d034405590a0'
            '29955fe97cdb3cc2eb72b7b05f1ae38cc5c98b1740a0db96d61f51a13d380cd8'
            '99fb50907d98640b21a42d00fccee1fa33a02dfabf94a40374766fcc823f5dd3'
            '6557e9c5ff2a8e0d5f0a91d9faa0ac43b7278926631d45a504cd17fe07fd3c68'
            '2fa49ced7b47cf05641d1413965244693ffd514ec9d409a784b92751ae4d1c90'
            'e0c28752df197ce38f9762aded5df12e1ba1181f721f42fddb83ec1178e90c58')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i "${srcdir}/libofa-gcc4.patch"
  patch -p1 -i "${srcdir}/libofa-gcc4.3.patch"
  patch -p1 -i "${srcdir}/libofa-gcc4.5.patch"
  patch -p1 -i "${srcdir}/libofa-0.9.3-gcc-4.7.patch"
  patch -p1 -i "${srcdir}/libofa-0.9.3-curl-7.21.patch"
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
