# $Id$
# Maintainer: Shane Stone <shanewstone gmail>
pkgname=python-spiceypy
pkgver=7.0.0
pkgrel=1
pkgdesc="A Python wrapper for the NAIF C SPICE Toolkit (N67) written using ctypes."
arch=('any')
url="https://github.com/AndrewAnnex/SpiceyPy/"
license=('MIT')
makedepends=('cython' 'python-numpy' 'python-scikit-build-core' 'python-build' 'python-wheel' 'python-installer')
depends=('python-numpy')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-pandas')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/andrewannex/spiceypy/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('4be66573204ffadf4635db72d80085b0a5f6eedc01ce0eb7e98cb287329fe8ae749462810f288c245ba75c40e123fd5209fdf67021e00ae4181f007fd6573493')

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
