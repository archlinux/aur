# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=8.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('cython' 'python-numpy' 'python-scikit-build-core' 'python-build' 'python-wheel' 'python-installer')
depends=('python-numpy')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-pandas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrewannex/spiceypy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('2801208c2b978bca818cd023f6e61d0e740a1fedc22d27e31803aa3eeed51f6f45522cfc02a471ea6d9888217e1c4466807e088ec5911b987a1719c4327bee22')

build() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m build --wheel --no-isolation

}

check() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m pytest --pyargs spiceypy --benchmark-disable

}

package() {

    cd "${srcdir}/SpiceyPy-${pkgver}"

    python -m installer --destdir="${pkgdir}" dist/*.whl

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

}
