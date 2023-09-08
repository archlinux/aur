# Maintainer: acxz <akashpatel2008 at yahoo dot com>

pkgname=python-mlflow
pkgver=2.6.0
pkgrel=1
pkgdesc='An open source platform for the machine learning lifecycle'
arch=('x86_64')
url='https://mlflow.org'
license=('Apache-2.0')
depends=('python' 'python-alembic' 'python-docker' 'python-flask' 'python-numpy'
    'python-scipy' 'python-pandas' 'python-prometheus-flask-exporter'
    'python-querystring-parser' 'python-sqlalchemy' 'gunicorn'
    'python-click' 'python-cloudpickle' 'python-databricks-cli'
    'python-entrypoints' 'python-gitpython' 'python-pyaml'
    'python-protobuf' 'python-pytz' 'python-requests' 'python-packaging'
    'python-importlib-metadata' 'python-sqlparse')
optdepends=('python-scikit-learn: for mlflow[extras, pipelines]'
            'python-pyarrow: for mlflow[extras, pipelines]'
            'python-boto3: for mlflow[extras]'
            'python-google-cloud-storage: for mlflow[extras]'
            'python-azureml-core: for mlflow[extras]'
            'python-pysftp: for mlflow[extras]'
            'python-kubernetes: for mlflow[extras]'
            'python-mlserver: for mlflow[extras]'
            'python-mlserver-mlflow: for mlflow[extras]'
            'python-virtualenv: for mlflow[extras]'
            'python-shap: for mlflow[pipelines]'
            'python-pandas-profiling: for mlflow[pipelines]'
            'python-ipython: for mlflow[pipelines]'
            'python-markdown: for mlflow[pipelines]'
            'python-jinja: for mlflow[pipelines]'
            'python-mlflow-dbstore: for mlflow[sqlserver]'
            'python-aliyunstoreplugin: for mlflow[aliyun-oss]'
            )
makedepends=('python' 'python-build' 'python-installer' 'python-wheel'
             'python-setuptools' 'yarn')
source=("$pkgname-$pkgver::https://github.com/mlflow/mlflow/archive/v$pkgver.tar.gz")
sha256sums=('b2769ec36461251ae0a6a8d2e626470c6f2f0b20dd87160e82bd36dc7c641462')

_pkgname=mlflow

build() {
  export NODE_OPTIONS=--openssl-legacy-provider
  cd "${srcdir}/${_pkgname}-${pkgver}"
  cd mlflow/server/js
  yarn install
  yarn run build

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
