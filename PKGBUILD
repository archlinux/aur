# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aws-sdk-signers
pkgname=python-$_name
pkgver=0.6.0
pkgrel=1
pkgdesc='Standalone HTTP Request Signers for Amazon Web Services.'
arch=('any')
_repo='https://github.com/smithy-lang/smithy-python'
url="$_repo/tree/develop/packages/$_name"
license=('Apache-2.0')
depends=('python')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-freezegun'
              'python-smithy-aws-event-stream')
source=("$_name-$pkgver.tar.gz::$_repo/archive/refs/tags/$_name/v$pkgver.tar.gz")
sha256sums=('75846466cbf43d3bc1226b4c4f268f78fa05fbbfa1c9f352166c0efba3d282e6')

build() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --override-ini="addopts="
  )
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "smithy-python-$_name-v$pkgver/packages/$_name"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
