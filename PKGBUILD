# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-aeppl
_pkgname=aeppl
pkgver=0.0.32
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
sha256sums=('20b9fc195addb33394e3bbbe3aef91116b08993ac9f626af1f04fdcc83c9e7de')

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
