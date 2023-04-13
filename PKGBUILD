pkgname=('phonopy')
pkgver=2.18.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://atztogo.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib")
optdepends=("python-spglib" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/phonopy/phonopy/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('19b07f64cdb2599fccf862cf0c39e90af38aedba446edf6bb8c92d9640b3622cda486ed368377c4816cacf159ce186933a11575a3cefc9e3d570a70aff69c770')


package() {
  cd "$srcdir"/phonopy-$pkgver
  # uncomment for openmpi build
  sed -i "s/with_openmp = False/with_openmp = True/" setup.py
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
