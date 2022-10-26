# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.36.1
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'vtk')
optdepends=('python-meshio')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}.tar.gz")
sha512sums=('e1a789a7a8018aaab179bd7d20b99abef1c5a022b87c56d1fa9bdfe1d470d60b240adaea61feb2f00d46b65aebc24c67b4b632186d89937b7380b35afb351442')

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
