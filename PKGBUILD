# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_name=${pkgname#python-}
pkgver=5.2.0
pkgrel=2
pkgdesc="Markov chain Monte Carlo for Python"
arch=(any)
url="https://github.com/pymc-devs/pymc"
license=(MIT)
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
sha256sums=('0c9363a45df7584936943291b84563d910f31e7392ef89cd39365b64daeddc7c')

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
