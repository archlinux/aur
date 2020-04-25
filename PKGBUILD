# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=1.8.0
pkgrel=1
pkgdesc='An open source platform for the machine learning lifecycle'
arch=('x86_64')
url='https://mlflow.org'
license=('Apache-2.0')
depends=('python' 'python-alembic<=1.4.1' 'python-click' 'python-cloudpickle'
    'python-databricks-cli' 'python-requests' 'python-six' 'gunicorn'
    'python-flask' 'python-numpy' 'python-pandas' 'python-dateutil'
    'python-protobuf' 'python-gitpython' 'python-pyaml'
    'python-querystring-parser' 'python-simplejson'
    'python-docker' 'python-entrypoints' 'python-sqlparse'
    'python-sqlalchemy<=1.3.13' 'python-gorilla'
    'python-prometheus-flask-exporter')
optdepends=('python-scikit-learn' 'python-boto3' 'python-mleap'
    'python-azure-storage' 'python-google-cloud-storage' 'python-mlflow-dbstore')
makedepends=('python' 'python-setuptools' 'npm')
source=("$pkgname-$pkgver::https://github.com/mlflow/mlflow/archive/v$pkgver.tar.gz")
sha256sums=('f70f5c21d98a21db523e0512f1acaa896cfda6f3f47d4007127e99bd27d1ab4d')

_pkgname=mlflow

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd mlflow/server/js
  npm install
  npm run build

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1
}
