# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.34.0
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'vtk')
optdepends=('python-meshio')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}.tar.gz")
sha512sums=('283ac9e51cb25baf4443de90fc72d8f794787d0360a18f66a5a0917212346a6bd8e456a15fa151cb1354f463cb809fa19c7c71fea00335732bf11351ebbb14e2')

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
