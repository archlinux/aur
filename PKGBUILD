# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-ccxt
_pkgname=${pkgname:7}
pkgver=4.4.95
pkgrel=1
pkgdesc="A cryptocurrency trading library with support for more than 100 exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=(python python-certifi python-requests python-cryptography python-aiohttp python-aiodns python-yarl)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('78a3139216c1c2b3204e47434fb14f570a624d62409ba4337594f8d23cac0da6')

prepare() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  mv -f README.rst README.md 2>/dev/null || true
}

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
