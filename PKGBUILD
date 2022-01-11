# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=1.22.0
pkgrel=1
pkgdesc='An open source platform for the machine learning lifecycle'
arch=('x86_64')
url='https://mlflow.org'
license=('Apache-2.0')
depends=('python' 'python-alembic' 'python-azure-storage-blob' 'python-click'
    'python-cloudpickle' 'python-databricks-cli' 'python-requests' 'python-six'
    'gunicorn' 'python-flask' 'python-numpy' 'python-pandas' 'python-dateutil'
    'python-protobuf' 'python-gitpython' 'python-pyaml'
    'python-querystring-parser' 'python-docker' 'python-entrypoints'
    'python-sqlparse' 'python-sqlalchemy' 'python-prometheus-flask-exporter')
optdepends=('python-scikit-learn' 'python-pyarrow' 'python-boto3' 'python-mleap'
    'python-google-cloud-storage' 'python-azureml-core' 'python-pysftp'
    'python-kubernetes' 'python-mlflow-dbstore' 'python-aliyunstoreplugin')
makedepends=('python' 'python-setuptools' 'npm')
source=("$pkgname-$pkgver::https://github.com/mlflow/mlflow/archive/v$pkgver.tar.gz")
sha256sums=('436f5c54f182a33aced193bed436e821024a2e746afdef320278e703d4e98232')

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
