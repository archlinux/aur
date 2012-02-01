# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=3.0
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('BSD')
depends=('python-virtualenv' 'python2-virtualenv')
source=(http://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('c203125e8cca88b5eef2d4aded76818d42393cb02da27af677db91d5c6d57151')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1

  # Use Python 2
  sed -i 's/which python/&2/' "$pkgdir/usr/bin/virtualenvwrapper.sh"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
