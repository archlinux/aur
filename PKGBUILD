# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=prefab-ui
pkgname=python-$_name
pkgver=0.20.2
pkgrel=1
arch=('any')
url='https://github.com/PrefectHQ/prefab'
license=('Apache-2.0')
depends=('python'
         'python-pydantic'
         'python-cyclopts'
         'python-rich')
makedepends=('python-hatchling'
             'python-uv-dynamic-versioning'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-pytest'
              'python-pytest-asyncio'
              'python-pytest-timeout'
              'python-pytest-xdist'
              'python-jsonschema')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('7473db4c9aca69f45cd13c77b64edcc09b0f496a2013d18987a990490cde5850')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name
  PYTHONPATH=$PWD/src pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
}
