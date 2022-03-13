# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgname=python-pyvista
pkgver=0.33.3
pkgrel=1
pkgdesc='3D plotting and mesh analysis through a streamlined interface for the Visualization Toolkit (VTK)'
arch=('any')
url='https://www.pyvista.org'
license=('MIT')
makdepends=('python-setuptools')
depends=('python-numpy' 'python-imageio' 'python-pillow' 'python-appdirs' 'python-scooby' 'paraview')
optdepends=('python-meshio')
source=("https://github.com/pyvista/pyvista/archive/v${pkgver}.tar.gz")
sha512sums=('f76e3856e560a656be8f3155a1c826b1a038976722798b5a9c5aa7c2b7e49e164f6a3ef0d22cc37eeeba267393e7216977b23c57508794170f90c7a3c4f2c2b6')

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
