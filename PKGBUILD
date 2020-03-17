pkgname=python-freqtrade-git
pkgver=0.14.3.r7484.g54c07e5e
pkgrel=1
pkgdesc="Simple High Frequency Trading Bot for crypto currencies"
url="https://github.com/gcarq/freqtrade/"
arch=('any')
license=('GPLv3')
provides=('python-freqtrade')
makedepends=('python' 'python-setuptools')
depends=('python-sqlalchemy' 'python-cachetools'
         'python-arrow' 'python-requests' 'ta-lib' 'python-pip'
         'python-urllib3' 'python-wrapt' 'python-pandas' 'python-scikit-learn'
         'python-scipy' 'python-jsonschema' 'python-numpy' 'python-pytest'
         'python-pytest-mock' 'python-pytest-cov' 'python-networkx'
         'python-telegram-bot' 'python-tabulate' 'python-hyperopt' 'python-ta-lib'
         'python-bittrex' 'python-questionary' 'python-jinja' 'python-sdnotify' 'python-rapidjson')
         
_branch="master"
source=("$pkgname"::"git://github.com/gcarq/freqtrade.git#branch=${_branch}")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  version=$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g')
  sed -i "s/^__version__.*$/__version__ = '$version'/g" freqtrade/__init__.py
  echo $version
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py build
  python setup.py install --prefix=/usr --root="$pkgdir"

  install -D -m644 LICENSE \
	  "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
