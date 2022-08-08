# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_pkgname=aeppl
pkgver=0.0.33
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
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea464f5e7b0a13242c8e1a4a7340d91f977db5a451184b4b9d1145364ba939a0')

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
