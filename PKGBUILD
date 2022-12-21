# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_name=${pkgname#python-}
pkgver=5.0.1
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=('i686' 'x86_64')
url="https://github.com/pymc-devs/pymc"
license=('MIT')
makedepends=(python-setuptools)
depends=(
  python-arviz
  python-cachetools
  python-cloudpickle
  python-fastprogress
  python-numpy
  python-pandas
  python-pytensor
  python-scipy
  python-typing_extensions
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1e4faa4ddb0853dccf9509027f040f5ef46f7beb7765405e51fb10aebc93ca11')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python setup.py build
}

package() {
  cd "$_archive"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
