pkgname=('phonopy')
pkgver=2.8.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://atztogo.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib")
optdepends=("python-spglib" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phonopy/archive/v$pkgver.tar.gz")
sha512sums=('8131072e46fe73fb7c69f9877d3dc13097cd8872c44288c9f6648cac5caa75b14904f30cdad4c2da9796396dc5fa6099f07cc8db261a4c2315ca423cc728dc84')



package() {
  cd "$srcdir"/phonopy-$pkgver
  # uncomment for openmpi build
  sed -i "s/with_openmp = False/with_openmp = True/" setup.py
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
