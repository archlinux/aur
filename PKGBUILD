# Maintainer: Michael Egger <michael.egger at tsn at>

pkgname=python-freqtrade-git
pkgver=0.13.0.r0.ge2eceaa
pkgrel=1
pkgdesc="Simple High Frequency Trading Bot for crypto currencies"
url="https://github.com/gcarq/freqtrade/"
arch=('any')
license=('GPLv3')
provides=('python-freqtrade')
makedepends=('python' 'python-setuptools')
depends=('python-sqlalchemy'
         'python-arrow' 'python-requests' 'ta-lib' 'python-pip'
         'python-urllib3' 'python-wrapt' 'python-pandas' 'python-scikit-learn'
         'python-scipy' 'python-jsonschema' 'python-numpy' 'python-pytest'
         'python-pytest-mock' 'python-pytest-cov' 'python-networkx'
         'python-telegram-bot' 'python-bittrex' 'python-ta-lib'
         # TODO: make proper package for hyperopt
)
_branch="master"
source=("$pkgname"::"git://github.com/gcarq/freqtrade.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # Install hyperopt
  pip install --prefix=/usr --root="hyperopt" hyperopt

  cd "$srcdir/$pkgname"
  python setup.py build
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
