# Maintainer: nandub <dev@nandub.info>
pkgname=primesieve
pkgver=4.4
pkgrel=1
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://code.google.com/p/primesieve/"
license=("BSD")
depends=(gcc-libs)
source=(http://primesieve.googlecode.com/files/$pkgname-$pkgver-src.zip)
sha1sums=('52f1e3161ca82591aee038412069c9845dc54ca7')
arch=('i686' 'x86_64')
build() {
  pushd ${srcdir}/$pkgname-$pkgver || return 1
    make bin lib shared || return 1
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
    install -m644 include/primesieve/soe/*.h "$pkgdir/usr/include/primesieve/soe"
    install -m644 lib/lib${pkgname}.* "$pkgdir/usr/lib"
    install -m644 doc/* "$pkgdir/usr/share/doc/${pkgname}"
    install -m644 COPYING "$pkgdir/usr/share/licenses/${pkgname}"
  popd
}
