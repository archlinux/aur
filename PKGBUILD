pkgname=python-freqtrade
_pkgname=${pkgname:7}
pkgver=2022.7
pkgrel=1
pkgdesc="Free, open source crypto trading bot"
url="https://github.com/freqtrade/freqtrade"
arch=('any')
license=('GPL3')
makedepends=(python-build python-installer python-wheel)
depends=(
  python
  python-numpy
  python-pandas
  python-pandas-ta
  python-ccxt
  python-cryptography
  python-aiohttp
  python-sqlalchemy
  python-telegram-bot
  python-arrow
  python-cachetools
  python-requests
  python-urllib3
  python-jsonschema
  python-ta-lib
  python-technical
  python-tabulate
  python-pycoingecko
  python-jinja
  python-tables
  python-blosc
  python-py-find-1st
  python-rapidjson
  python-sdnotify
  python-fastapi
  uvicorn
  python-pyjwt
  python-aiofiles
  python-psutil
  python-colorama
  python-questionary
  python-prompt_toolkit
  python-dateutil
)
optdepends=(
  'python-scipy: hyperopt' 
  'python-scikit-learn: hyperopt' 
  'python-scikit-optimize: hyperopt' 
  'python-filelock: hyperopt' 
  'python-joblib: hyperopt' 
  'python-progressbar: hyperopt' 
  'python-plotly: plot' 
)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('aca21b99ed953c8223fdb5ed640bd5842586755e322b5ecd443ff08f48d13ad5')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 
}
