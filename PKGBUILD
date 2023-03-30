pkgname=('python-phononlammps')
pkgver=0.8.1
pkgrel=2
pkgdesc="Dynaphopy allows to calculate anharmonic phonon linewidhts and frequency shifts using the mode descomposition technique"
arch=('any')
url="https://phonolammps.readthedocs.io/"
license=('MIT')
depends=("python-phonopy" "python-numpy" "python-matplotlib" "python-seekpath" "python-dynaphopy")
optdepends=()
makedepends=('python-setuptools' 'python')
source=(
  https://github.com/abelcarreras/phonolammps/archive/refs/tags/$pkgver.tar.gz
  plot_phonon_dispersion_bands-add-param.patch
)
sha256sums=(
  '5abdf6bf1caeb5e2a0ca872784a396ca7f4e37e5e64d11a13e12cda49fc74884'
  'a10947d5cc04d1db6fa3d2b1d303edac0c35ff9c84d2a7d474a0b686bfbd76a0'
  )

prepare() {
  cd "$srcdir"/phonolammps-$pkgver
  patch -p1 phonolammps/__init__.py ../plot_phonon_dispersion_bands-add-param.patch
}

package() {
  cd "$srcdir"/phonolammps-$pkgver

  python setup.py install --root "$pkgdir" --optimize=1
  # uncomment for openmpi version
  # python setup_openmp.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}