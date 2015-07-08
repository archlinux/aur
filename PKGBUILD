# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Mathieu Clabaut <mathieu.clabaut@gmail.com>
pkgname=mwlib.ext
pkgver=0.13.2
pkgrel=1
pkgdesc="external dependencies for mwlib"
arch=(i686 x86_64)
url="http://code.pediapress.com/wiki/wiki"
# ReportLab is BSD, GPL, and LGPL
license=('BSD' 'GPL' 'LGPL')
Changelog=Changelog
depends=('python2' 'freetype2')
makedepends=('python2-setuptools' )
source=("http://pypi.python.org/packages/source/m/$pkgname/$pkgname-$pkgver.zip")
md5sums=('36193837359204d3337b297ba0f20bc8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir"
  find "$pkgdir" -name "*.py" -exec \
    sed -i '1s/python/python2/' {} \;

  local license_target="$pkgdir/usr/share/licenses/$pkgname"
  install -D -m644 upstream-src/LICENSE.txt \
    "$license_target/reportlab-LICENSE.txt"
  install -D -m644 upstream-src/src/reportlab/fonts/bitstream-vera-license.txt \
    "$license_target/bitstream-vera-license.txt"
}

