# Maintainer: nandub <dev@nandub-dev.tk>
pkgname=primesieve
pkgver=3.8
pkgrel=3
pkgdesc="C++ library that generates prime numbers and prime k-tuplets"
url="http://code.google.com/p/primesieve/"
license="BSD"
depends=(gcc-libs)
source=(http://primesieve.googlecode.com/files/$pkgname-$pkgver-src.zip)
sha1sums=('ada0024ed13be6b43eb70f7c794161e289e73d5d')
arch=('i686' 'x86_64')
build() {
  pushd ${srcdir}/$pkgname-$pkgver || return 1
    make bin lib SHARED=yes || return 1
  popd || return 1
}

package() {
  pushd ${srcdir}/$pkgname-$pkgver || return 1
    install -D -m755 bin/primesieve "$pkgdir/usr/bin/primesieve"
    mkdir -p "$pkgdir/usr/include/primesieve/soe"
    install -D -m644 src/soe/*PrimeSieve.h "$pkgdir/usr/include/primesieve/soe"
    mkdir -p "$pkgdir/usr/lib"
    install -D -m644 lib/lib${pkgname}*.so "$pkgdir/usr/lib"
    mkdir -p "$pkgdir/usr/share/doc/${pkgname}"
    install -D -m644 doc/* "$pkgdir/usr/share/doc/${pkgname}"
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  popd
}
