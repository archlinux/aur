# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.14.0
pkgrel=1
pkgdesc='A Python Package to Tackle the Curse of Imbalanced Datasets in Machine Learning'
arch=(any)
license=('MIT')
url='https://imbalanced-learn.org/'
depends=(
    'python-numpy'
    'python-scipy'
    'python-scikit-learn'
    'python-joblib'
    'python-threadpoolctl'
)
optdepends=(
    'python-pandas'
    'python-keras-applications'
    'python-tensorflow'
)
makedepends=(
    'python-build'
    'python-installer'
)
source=("git+https://github.com/scikit-learn-contrib/imbalanced-learn.git#tag=${pkgver}")
# use makepkg -g to update
sha256sums=('2e2299abd3ff662e8cb5fdadb4a88dbcd2d0a8d08c13de917ebbfa52a87e6eb5')

build() {
  cd "${srcdir}/imbalanced-learn"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/imbalanced-learn";
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -D -m644 "README.rst" "${pkgdir}/usr/share/doc/${pkgname}/README.rst"
  install -D -m644 "doc/install.rst" "${pkgdir}/usr/share/doc/${pkgname}/INSTALL.rst"
}

