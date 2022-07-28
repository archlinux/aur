# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=lpcnetfreedv
_pkgname=LPCNet
pkgver=0.3
pkgrel=1
pkgdesc="Experimental Neural Net speech coding for FreeDV"
arch=('i686' 'x86_64' 'aarch64')
license=('GPL2')
url="https://freedv.org/"
depends=('glibc' 'codec2')
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('cae30c8a4c906ecdcd6d4cfc2da0b30410a37281753d987a35e4669f8cbb58ee29ee234f36eab458d4843ee840ce3f40973c652b364cec00c75052a37bf99ea5')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_INTERNAL_CODEC2=FALSE
  make -C build
}
	
package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D "$_pkgname-$pkgver/COPYING" "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
