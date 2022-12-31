# Maintainer: Davide Gerhard <rainbow@irh.it>

pkgname=lpcnetfreedv
_pkgname=LPCNet
pkgver=0.4
# they have not tagged the release
# needed to remove circular dependency of codec2
_pkgcommit=1431ee3f32aa96b91a41215076bda6847171705d
pkgrel=1
pkgdesc="Experimental Neural Net speech coding for FreeDV"
arch=('x86_64' 'aarch64')
license=('BSD')
url="https://freedv.org/"
makedepends=('cmake')
source=("${_pkgname}-${_pkgcommit}.tar.gz::https://github.com/drowe67/$_pkgname/archive/$_pkgcommit.tar.gz")
sha512sums=('c1dcfca3d234524f180e67e6e68ff8b2575c4f3fd0d408e583dbb9b2792b49251a247fe1b90f7e8b888162c8b6bd4b5b9e6bfb4f4c42d80d2724400833c237c4')

build() {
  cmake -B build -S "$_pkgname-$_pkgcommit" \
    -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_INTERNAL_CODEC2=FALSE
  make -C build
}
	
package() {
  make -C build DESTDIR="$pkgdir" install
  install -m644 -D \
    "$_pkgname-$_pkgcommit/COPYING" \
    "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}
