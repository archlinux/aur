# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.43.1
pkgrel=1
pkgname=python-pyvista
_name=${pkgname#python-}
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'vtk' 'python-matplotlib')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-meshio' 'xorg-server-xvfb')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('450df6b0427e5befc696b07d4e9a93656a898369e92849189e62fd1b60f672b26db1ebf0df6f3300bf1fefcd7edab8600ecaaf0800ac94c474c7d0c3ee01d24f')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
