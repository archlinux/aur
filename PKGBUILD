# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.33.1
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'python-meshio' 'paraview')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}.tar.gz")
sha512sums=('6e4f2a044a850d96b12267e2a38ff0c9bc9af2b75c9427f1674111e4380b96e0cc6e27479098d05a520cf131322e0824292fe147070a5834163fc2b38af875f3')

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
