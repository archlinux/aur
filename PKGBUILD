# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_pkgname=aeppl
pkgver=0.0.50
pkgrel=2
pkgdesc="Tools for an Aesara-based PPL"
arch=('any')
url="https://github.com/aesara-devs/aeppl"
license=('MIT')

makedepends=(python-setuptools)
depends=(
  python-numpy
  python-scipy
  python-aesara
  python-typing_extensions
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('857b1c134060da1552175eab7da94a2b1c9e794a169ebb51b022cb27d8a9dbf7')

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
