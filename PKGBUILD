pkgname=python-freqtrade
_pkgname=${pkgname:7}
pkgver=2022.7
pkgrel=2
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
  'orjson: webserver',
  'python-schedule: trade',
)

source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('19684c3da6b4edba2e8517d961da1ad551ca6ec37e285d475c4b3c03fed3941d')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -rf "$pkgdir"/usr/lib/python*/site-packages/tests 
}
