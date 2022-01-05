# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.33.0
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'python-meshio' 'paraview' 'python-transforms3d')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}.tar.gz")
sha512sums=('a42c18002f96bf811492e5c860171cad7fd9cd281ab0a1cde2cfc376a4650a774775611dd89009fb5aa3cfd852dd887938242bc089f4e184b707ad339bdff900')

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
