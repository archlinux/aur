# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=1.20.2
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
sha256sums=('fab2d6fc4dc2c92bc3087dca57b5708302d6a6b1baaad06cb5c05a1428ebc828')

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
