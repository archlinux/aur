# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Chris Baker <baker.chris.3@gmail.com>
pkgname=parallel-python
_pkgname=pp
pkgver=1.6.4
pkgrel=1
pkgdesc="Parallel and distributed programming for Python"
arch=(any)
url="http://www.parallelpython.com/"
license=('BSD')
depends=(python2)
makedepends=(python2-distribute)
changelog=Changelog
source=(http://www.parallelpython.com/downloads/$_pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('efadf289d3c94961b6de7373d3f8be38')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
  install -Dm 644 "COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/COPYING"
  install -Dm 644 "doc/ppserver.1" "${pkgdir}/usr/share/man/man1/ppserver.1"
  install -m 644 -d "$pkgdir/usr/share/doc/$pkgname"
  cp -R examples "$pkgdir/usr/share/doc/$pkgname/"
  chmod -R 755 "$pkgdir/usr/share/doc/$pkgname"
  # Shebang fix for examples
  find "$pkgdir/usr/share/doc/" -name "*.py" -exec \
    sed -i '1s/python[[:space:]]*/python2/' {} \;
}

