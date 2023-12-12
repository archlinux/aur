# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=python-ccxt
_pkgname=${pkgname:7}
pkgver=4.1.86
pkgrel=1
pkgdesc="A cryptocurrency trading library with support for 130+ exchanges"
arch=(any)
url="https://ccxt.trade"
license=(MIT)
depends=(python python-certifi python-requests python-cryptography python-aiohttp python-aiodns python-yarl)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('c663a6c69a4aa71232a44282cc1e1124b6a9432dd2534c5c5a4500b9a5568826')

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
