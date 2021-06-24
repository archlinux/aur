# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.31.3
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'python-meshio' 'paraview' 'python-transforms3d')
source=("https://github.com/pyvista/pyvista/archive/${pkgver}.tar.gz")
sha512sums=('1b3d4b2c92ce3c84e2266235bb5261dd4aee71d4bc2d15561971e8b07bf6afdb56a99ea2af7c3e88a103adbd9087f3f394b44059d59d24c5acacbb7f6da71107')

build() {
  cd "$srcdir"/pyvista-${pkgver}
  python setup.py build_ext --inplace
  python setup.py build
}

package() {
  cd "$srcdir"/pyvista-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
