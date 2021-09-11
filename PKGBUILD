# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.32.0
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'python-meshio' 'paraview' 'python-transforms3d')
source=("https://github.com/pyvista/pyvista/archive/${pkgver}.tar.gz")
sha512sums=('ff89017d36f364762b9efe2e5ab0ef31ef9da543db398ff9ae4f4384b6d1ec7dfab7343d1f0d9b6e6c35414800a94fc1c1fdf875b5c2726a444d056320de46e2')

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
