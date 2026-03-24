# Maintainer: George Tsiamasiotis <george+aur@tsiamasiotis.gr>

_pkgname='pyTooling'
pkgname=python-${_pkgname@L}
pkgver=8.14.0
pkgrel=1
pkgdesc="A collection of arbitrary useful classes, decorators, meta-classes and exceptions"
arch=(any)
url="https://pytooling.github.io/pyTooling"
license=('Apache-2.0')
depends=(
  'python'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
  'python-colorama'
  'python-aiohttp'
  'python-requests'
  'python-ruamel-yaml'
  'git'
)
optdepends=(
  'python-aiohttp: PyPi support'
  'python-packaging: PyPi support'
  'python-requests: PyPi support'
  'python-setuptools: Packaging support'
  'python-colorama: Terminal color support'
  'python-argcomplete: Terminal autocompletion support'
  'python-ruamel-yaml: YAML support'
)

source=("$pkgname-$pkgver.tar.gz::https://github.com/pyTooling/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('2aa9f43a03fe4d35f74292d308be8847de26d00c873c41e683bc8963b7d5eaa1')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check(){
  cd "$_pkgname-$pkgver"
  pytest tests \
  	--ignore tests/performance --ignore tests/benchmark \
  	-o python_files='*' -o python_functions='test_*'
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
