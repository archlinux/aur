# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
pkgname=python-nanoid
_name=${pkgname#python-}
pkgdesc="A tiny, secure, URL-friendly, unique string ID generator for Python"
pkgver=2.0.0
pkgrel=3
arch=('any')
url="https://github.com/puyuan/py-nanoid"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz"
        'https://raw.githubusercontent.com/puyuan/py-nanoid/master/LICENSE')
sha256sums=('5a80cad5e9c6e9ae3a41fa2fb34ae189f7cb420b2a5d8f82bd9d23466e4efa68'
            '1aca51d22bea4295ae532076d9dbb9944712e853e41aac5e5f2c99309d1f0466')

build() {
  cd "${_name}-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-$pkgver"
  python -m installer --destdir "$pkgdir" dist/*.whl

  install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
