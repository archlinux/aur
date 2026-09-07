# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.48.0
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for VTK'
arch=(any)
url=https://www.pyvista.org
license=(MIT)
depends=(python-cyclopts python-matplotlib python-numpy python-pillow python-pooch python-scooby python-typing_extensions vtk)
optdepends=(python-meshio xorg-server-xvfb python-imageio)
makedepends=(python-build python-installer python-wheel python-setuptools)
_name=${pkgname#python-}
source=(https://github.com/pyvista/${_name}/archive/v${pkgver}/${_name}-${pkgver}.tar.gz)
sha512sums=('2e5ab167ff14060ce00d1062846349ceae3d9bf098c05a362f1f3a9c8c25a831ac72ae83e3a46a509dcb5d233be58b06a38bbb84ba65a6397d37cabe18536a32')

build() {
    cd ${_name}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${_name}-${pkgver}
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
