# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.37.0
pkgrel=2
pkgname=python-pyvista
_name=${pkgname#python-}
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'vtk')
makedepends=('python-build' 'python-installer' 'python-wheel')
optdepends=('python-meshio')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('e0339ff8927e8ec87351a9e2529880260f06171a2fc43c363396b00ff0f60cb4b507b60aad164395b7a3c274b9bf2c494d0737e260f5e77e5a7ca1d1d453964b')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
