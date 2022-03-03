# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython3
pkgver=3.0.0a10
pkgrel=2
pkgdesc="C-Extensions for Python"
arch=(x86_64)
url="https://cython.org"
license=(APACHE)
depends=('python')
makedepends=(python-setuptools)
provides=('cython')
conflicts=('cython')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cython/cython/archive/$pkgver.tar.gz"
        cython-hash-int-conversion.patch::"https://github.com/cython/cython/commit/28251032.patch"
        "https://patch-diff.githubusercontent.com/raw/cython/cython/pull/4528.patch")
sha256sums=('d530216e015fd365bf3327a176e0073d0e5b8d48781f387336459f10032d776f'
            '28b2b065a9853e86d0bc09287e8a21f50ebc1f3cfee3b2ab03b6b917cb9e81d8'
            '54a6c1fa1830fdcd3aac596877622bdf25e928d7a2947a001325d12e0a4dc219')

prepare() {
    cd "cython-$pkgver"
    patch -p1 -i ../4528.patch
}

build() {
  cd "cython-$pkgver"
  python setup.py build
}

package() {
  cd "cython-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
