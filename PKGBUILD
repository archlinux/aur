# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_name=${pkgname#python-}
pkgver=5.0.0
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

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz"
  "0001-Update-PyTensor-dependency.patch"
)
sha256sums=(
  '67d445b9c8ab254f1cdab5c3525bc2a9a73d05ca943942bcc44c48228152bb2f'
  '315ba73fc201aab61d86edbd24211deb92f7d54b2708bb87a0d4d45f614c5d49'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="${srcdir}/0001-Update-PyTensor-dependency.patch"
}

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
