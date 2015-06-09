# Maintainer: Thor M. K. Høgås <thor alfakrøll roht dott no>
pkgname=libfyba
pkgver=4.1.1
pkgrel=2
pkgdesc="Library for reading and writing to the national Norwegian geographical SOSI-format"
arch=('i686' 'x86_64')
url="https://github.com/kartverket/fyba"
license=('custom')
depends=('gcc-libs')
source=("https://github.com/kartverket/fyba/archive/4.1.1.tar.gz")
sha512sums=('0a8951e0b7a7197bc03d86d0cda8deeb772f96ec13e482e3a3fa8f061c637775eabcf010d0a9a71c7bfe7dff360c31be5ed3bbe76112ae6a1b8a0056fb847458')

build() {
  cd "fyba-${pkgver}"
  sed '1,/LICENSE/d' README > LICENSE
  autoreconf --force --install
  ./configure --prefix=/usr
  make
}

package() {
  install -D -m644 "fyba-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cd "fyba-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
