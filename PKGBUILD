pkgname=python-ccxt
_pkgname=${pkgname:7}
pkgver=1.82.51
pkgrel=1
pkgdesc="A JavaScript / Python / PHP cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=(python python-certifi python-requests python-cryptography python-aiohttp python-aiodns python-yarl)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('72c182cd9c8c76c51c9fdcf2992ce4c5836ad939490eb045f948b518a66b2768')

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
