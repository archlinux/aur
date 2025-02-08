# Maintainer: Bruno Silva <brunofernandes at ua dot pt>
pkgname=libxerces-c-3.2
_pkgname=xerces-c
pkgver=3.2.5
pkgrel=1
pkgdesc="A validating XML parser written in a portable subset of C++ legacy version: 3.2"
arch=('i686' 'x86_64')
url="http://xerces.apache.org/xerces-c/"
license=('APACHE')
depends=('gcc-libs' 'curl' 'icu')
conflicts=('xerces-c<3.2')
source=("https://archive.apache.org/dist/xerces/c/3/sources/${_pkgname}-${pkgver}.tar.gz")
sha512sums=('e773321a59da409cceb958831f1af921b01f29df66bae43e4c02c6fa35c09de53ba5822fa4d4fb9c0bf98bd0d923bbdaac1f3f7a81187aeedc62aa89c6733b96')

build() {
  cd "${_pkgname}-${pkgver}"

  [[ "${CARCH}" = "i686" ]] && SSE2="--disable-sse2"
  ./configure --prefix=/usr --sysconfdir=/etc ${SSE2}
  make
  if [ -d build ]
  then
    rm -rf "./build"
  fi
  make DESTDIR="${srcdir}/build" install
}

package() {
  install -m 755 -d "${pkgdir}/usr/lib"
  install -m 755 -t "${pkgdir}/usr/lib" "${srcdir}/build/usr/lib/${pkgname}.so"
}
