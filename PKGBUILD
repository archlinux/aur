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
        "https://patch-diff.githubusercontent.com/raw/cython/cython/pull/4528.patch")
sha256sums=('d530216e015fd365bf3327a176e0073d0e5b8d48781f387336459f10032d776f'
            'ba082a7b47bc66bc76b0801b58d2d3b425bea4207a72eb5815bd0dd5318b1df0')

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
