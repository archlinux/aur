# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aioboto3
pkgname=python-$_name
pkgver=15.5.0
pkgrel=1
pkgdesc='Async boto3 wrapper.'
arch=('any')
url='https://github.com/terricain/aioboto3'
license=('Apache-2.0')
depends=('python' 'python-aiobotocore' 'python-boto3' 'python-aiofiles')
makedepends=('python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-dill' 'python-pygithub' 'python-requests' 'python-moto' 'python-antlr4' 'python-joserfc' 'python-jsonpath-ng' 'python-docker' 'python-graphql-core' 'python-pyyaml' 'python-cfn-lint' 'python-openapi-spec-validator' 'python-pyparsing' 'python-py-partiql-parser' 'python-aws-xray-sdk' 'python-flask' 'python-flask-cors' 'chalice' 'python-pytest-asyncio')
optdepends=('python-cryptography: s3cse' 'chalice: chalice')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('ea8d8787d315594842fbfcf2c4dce3bac2ad61be275bc8584b2ce9a3402a6979')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
