# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.14.2
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
sha256sums=('c516e97a2dad2738ce73c28ecf62a25eea34a33d0b3e483411cfbb0af7f35653')

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

