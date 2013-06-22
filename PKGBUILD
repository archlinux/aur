# Maintainer: nandub <dev@nandub.info>
pkgname=primesieve
pkgver=4.2
pkgrel=2
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://code.google.com/p/primesieve/"
license=("BSD")
depends=(gcc-libs)
source=(http://primesieve.googlecode.com/files/$pkgname-$pkgver-src.zip)
sha1sums=('6468d65a4ea15acdfb2a0785f437b39de45b717d')
arch=('i686' 'x86_64')
build() {
  pushd ${srcdir}/$pkgname-$pkgver || return 1
    make bin lib SHARED=yes || return 1
  popd || return 1
}

package() {
  pushd ${srcdir}/$pkgname-$pkgver || return 1
    # Create directory structures
    install -m755 -d "$pkgdir/usr/bin"
    install -m655 -d "$pkgdir/usr/include/primesieve/soe"
    install -m755 -d "$pkgdir/usr/lib"
    install -m655 -d "$pkgdir/usr/share/doc/${pkgname}"
    install -m655 -d "$pkgdir/usr/share/licenses/${pkgname}"
    # Copy files to their respective folders
    install -m755 bin/primesieve "$pkgdir/usr/bin"
    install -m644 src/soe/*PrimeSieve.h "$pkgdir/usr/include/primesieve/soe"
    install -m644 lib/lib${pkgname}*.so "$pkgdir/usr/lib"
    install -m644 doc/* "$pkgdir/usr/share/doc/${pkgname}"
    install -m644 COPYING "$pkgdir/usr/share/licenses/${pkgname}"
  popd
}
