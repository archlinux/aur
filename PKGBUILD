pkgname=python-ccxt
_pkgname=${pkgname:7}
pkgver=2.8.16
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=(python python-certifi python-requests python-cryptography python-aiohttp python-aiodns python-yarl)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('5b22a0b3f3f5b002714a942cdc75a07503956b945bcc06a0d8f65a4960483b22')

prepare() {
  cd "$srcdir"/ccxt-$pkgver
  mv README.{rst,md}
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -m0644 -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
