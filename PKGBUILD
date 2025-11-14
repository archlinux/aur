# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=lpcnetfreedv
_pkgname=LPCNet
pkgver=0.5
pkgrel=2
pkgdesc="Experimental Neural Net speech coding for FreeDV"
arch=('x86_64' 'aarch64')
license=('BSD-3-Clause')
url="https://freedv.org/"
makedepends=('cmake')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/drowe67/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('5582356a4075ea844999a53f3103a19951276db943a20ed43170ef56627d96e92381c479a55b22266d8805e769b6409410542407ad19a97ce24da17b21fbcd79')

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  make -C build
}
	
package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D \
    "$_pkgname-$pkgver/COPYING" \
    "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
