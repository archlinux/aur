pkgname=('phonopy')
pkgver=2.5.0
pkgrel=1
pkgdesc="Phonopy is an open source package for phonon calculations at harmonic and quasi-harmonic levels"
arch=('any')
url="https://atztogo.github.io/phonopy"
license=('BSD')
depends=("python-numpy" "python-scipy" "python-h5py" "python-pyaml" "python-matplotlib")
optdepends=("python-spglib" "openmpi")
makedepends=('python-setuptools' 'python')
source=("https://github.com/atztogo/phonopy/archive/v$pkgver.tar.gz")
sha512sums=('ce04f984948c1df4a913fd54a7a47707015ed81c7d1a9236910c59eeb9992731d5c5343ef1cbf08ce51858f02633728f4a3b1925ef0d8aad159886990f87d401')



package() {
  cd "$srcdir"/phonopy-$pkgver
  # uncomment for openmpi build
  sed -i "s/with_openmp = False/with_openmp = True/" setup.py
  python setup.py install --root "$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
