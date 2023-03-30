pkgname=('python-phonopy')
pkgver=2.17.2
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://phonopy.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-pyaml" "python-matplotlib" "python-spglib" "python-h5py")
optdepends=("python-spglib" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/phonopy/phonopy/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1c810e6b2e107d98b729eed7d7f62b0ab41d0c17690844adcd422bc9f5be3a30')



package() {
  cd "$srcdir"/phonopy-$pkgver
  # uncomment for openmpi build
  sed -i "s/with_openmp = False/with_openmp = True/" setup.py
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}