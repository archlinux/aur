# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastien Binet <binet@lblbox>

pkgname=python-virtualenvwrapper
pkgver=2.7.1
pkgrel=1
pkgdesc="Extensions to Ian Bicking's virtualenv tool"
arch=('any')
url="http://www.doughellmann.com/projects/virtualenvwrapper/"
license=('BSD')
depends=('python-virtualenv')
source=(http://pypi.python.org/packages/source/v/virtualenvwrapper/virtualenvwrapper-$pkgver.tar.gz)
md5sums=('b01930b245b2beb9fe2ce69a4b0e0f25')

build() {
  cd "$srcdir/virtualenvwrapper-$pkgver"

  python2 setup.py install --root="$pkgdir" -O1

  # Use Python 2
  sed -i 's/which python/\02/' "$pkgdir/usr/bin/virtualenvwrapper.sh"

  install -d "$pkgdir/usr/share/licenses/$pkgname"
  # Extract the license from README.txt
  sed -n '/Copyright/,$ p' README.txt \
    >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
