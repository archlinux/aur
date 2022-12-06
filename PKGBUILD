# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_pkgname=aeppl
pkgver=0.0.50
pkgrel=1
pkgdesc="Tools for an Aesara-based PPL"
arch=('any')
url="https://github.com/aesara-devs/aeppl"
license=('MIT')

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-scipy
  python-aesara
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c62bdcb07a731c9ab2157b2117ac4da667414651396303ead5886449a4a32ab7')

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
