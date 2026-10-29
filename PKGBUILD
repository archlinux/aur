# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=databricks-sdk
pkgname=python-$_name
pkgver=0.158.0
pkgrel=1
pkgdesc='Databricks SDK for Python (Beta).'
arch=('any')
url='https://github.com/databricks/databricks-sdk-py'
license=('Apache-2.0')
depends=('python'
         'python-certifi'
         'python-requests'
         'python-google-auth'
         'python-protobuf'
         'python-urllib3')
makedepends=('python-setuptools'
             'python-wheel'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-mock'
              'python-requests-mock'
              'python-pyfakefs'
              'python-openai'
              'python-langchain-openai'
              'python-httpx'
              'python-grpcio')
optdepends=('ipython: notebook'
            'python-ipywidgets: notebook'

            'python-openai: openai'
            'python-langchain-openai: openai'
            'python-httpx: openai'

            'python-protobuf: sandbox'
            'python-grpcio: sandbox')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ad2194fd8a65f288a7cd7eca38f1ded2296dc706b66cff0e74df4f4bb2bdd83')

build() {
  cd "$_name-py-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-py-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-py-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
