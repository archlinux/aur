# Maintainer: Tomas S. <me+aur at wereii.cz>
# Contributor: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Aaron DeVore <aaron.devore@gmail.com>

pkgname=python-roman
pkgver=4.2
pkgrel=3
pkgdesc="Integer to Roman numerals converter"
url="https://github.com/zopefoundation/roman"
depends=(python)
makedepends=(python-build python-installer python-wheel python-setuptools)
license=("PSF")
arch=("any")
source=("roman-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1b7daf7e6df4372630bb38e67d439368258d0c1f0f0708e6be9296b91c0efee2')

build() {
    cd "${srcdir}/roman-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/roman-${pkgver}/src"
    python -m unittest tests.py
}

package() {
    cd "${srcdir}/roman-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

