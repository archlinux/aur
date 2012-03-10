# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=3.1
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('BSD')
depends=('python-virtualenv' 'python2-virtualenv')
source=(http://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
sha256sums=('5c7db318155c1863905d70a0f009fd6378e5d3a7bef9d7eb5b0c12748e4053fc')

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
