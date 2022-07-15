# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: xia0er <xia0er@gmail.com>

pkgname=python-pymc
_pkgname=pymc
pkgver=4.1.3
pkgrel=1
pkgdesc="Markov chain Monte Carlo for Python"
arch=('i686' 'x86_64')
url="https://github.com/pymc-devs/pymc"
license=('MIT')

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-aesara
  python-pandas
  python-aeppl
  python-arviz
  python-cloudpickle
  python-cachetools
  python-fastprogress
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/v${pkgver}.tar.gz")
sha256sums=('5b06ea57c0a436c84e30126edd7fbd8c33247613f6d610b4fd9590692d82a149')

build() {
  cd "$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$_pkgname-$pkgver"

  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
