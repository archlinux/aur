# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws_sdk_transcribe_streaming
pkgname=python-$_name
pkgver=0.13.1
pkgrel=1
pkgdesc='aws_sdk_transcribe_streaming client.'
arch=('any')
_repo='https://github.com/awslabs/aws-sdk-python'
url="$_repo/tree/develop/clients/${_name//_/-}"
license=('Apache-2.0')
depends=('python'
         'python-smithy-aws-core'
         'python-smithy-aws-event-stream'
         'python-smithy-json'
         'python-smithy-core'
         'python-smithy-http'
         'python-aiohttp'
         'python-yarl'
         'python-urllib3')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-boto3'
              'python-pytest'
              'python-pytest-asyncio'
              'python-smithy-test'
              'python-awscrt')
optdepends=('python-awscrt: awscrt')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('30ff16b4a1bc3f3ccbc904fc56e2d3aa25d7e11065818f33aedb083b997f1cb4')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect tests/integration
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
