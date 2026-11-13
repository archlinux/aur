# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=smithy-http
pkgname=python-$_name
pkgver=0.9.0
pkgrel=1
pkgdesc='HTTP components for Smithy tooling.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/$_name"
license=('Apache-2.0')
depends=('python'
         'python-smithy-core')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-freezegun'
              'python-awscrt'
              'python-smithy-cbor'
              'python-smithy-json'
              'python-smithy-aws-event-stream'
              'python-aiohttp'
              'python-yarl'
              'python-urllib3')
optdepends=('python-awscrt: awscrt'

            'python-smithy-cbor: cbor'

            'python-smithy-json: json'

            'python-smithy-aws-event-stream: eventstream'

            'python-aiohttp: aiohttp'
            'python-yarl: aiohttp'

            'python-urllib3: urllib3')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('c0a9976128f4974a92c942dccbbcf2b6cd427761fc16e1be5f727c52b0191fb2')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
    --import-mode=importlib
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
