# Maintainer: Martin Marmsoler <martin.marmsoler@gmail.com>

_pkgname=sphinx-contrib-youtube
pkgname=python-sphinx-contrib-youtube
pkgver=1.3.0
pkgrel=2
pkgdesc="This package contains the youtube Sphinx extension."
arch=('any')
url='https://github.com/sphinx-contrib/youtube'
license=('BSD 3-Clause')
depends=(python python-sphinx python-requests)
makedepends=(python-flit)
checkdepends=(python python-pytest)
source=("$pkgname-$pkgver.tar.gz::https://codeload.github.com/sphinx-contrib/youtube/tar.gz/refs/tags/v$pkgver")
sha256sums=('d6191c26e1b16e880391c8a61dc4f99c892325987f1559b13117bec95faf5fd4')

build() {
  cd "youtube-$pkgver"
  flit build --format wheel
}

check() {
  cd "youtube-$pkgver"
  pytest
}

package() {
  cd "youtube-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 LICENCE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

