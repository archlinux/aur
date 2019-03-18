# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=python-ludwig
pkgver=0.1.0
pkgrel=3
pkgdesc='Train and test deep learning models'
arch=(any)
url='https://github.com/uber/ludwig'
license=(MIT)
depends=(cython python-cloudpickle python-dask python-h5py python-matplotlib python-numpy python-pandas python-scipy python-scikit-learn python-tqdm python-tabulate python-tensorflow python-yaml python-pytest python-scikit-image python-seaborn python-spacy-en_core_web_sm 'python-spacy>=2.0')
makedepends=(git)
source=("git+https://github.com/uber/ludwig#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd ludwig
  python setup.py build
}

package() {
  cd ludwig
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  sed -i '/spacy/d' "$pkgdir/usr/lib/python"*"/site-packages/ludwig-$pkgver-*.egg-info/requires.txt"
}

# vim: ts=2 sw=2 et:
