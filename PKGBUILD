# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.40.0
pkgrel=1
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
sha512sums=('1d462dd516de8552ae1a4a35463c0327336faa2bfd161562207c02e7074fec1717eeb0a6c000b0c57ff3915996a24405d939dab4c3eff46d61f9c2fea380435b')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
