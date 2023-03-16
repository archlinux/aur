# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Igor Scabini <furester @ gmail.com>

pkgname=cython3
pkgver=3.0.0b1
pkgrel=1
pkgdesc="C-Extensions for Python"
arch=(x86_64)
url="https://cython.org"
license=(APACHE)
depends=('python')
makedepends=(python-setuptools)
provides=('cython')
conflicts=('cython')
source=($pkgname-$pkgver.tar.gz::"https://github.com/cython/cython/archive/$pkgver.tar.gz"
    5282.patch)
sha256sums=('bca121dbe96c88de9f2369d9d9231dd6b481cca486514421ed8252b4390eab5b'
            'e44d7f30bab89135ecd83f3430c64259a2e0907f928d23ff2acec0e4045a574e')

prepare() {
  cd "cython-$pkgver"
  patch -p1 -i ../5282.patch
}

build() {
  cd "cython-$pkgver"
  python setup.py build
}

package() {
  cd "cython-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
