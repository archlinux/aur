# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>

pkgname=python-imblearn
pkgver=0.13.0
pkgrel=2
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
source=("git+https://github.com/scikit-learn-contrib/imbalanced-learn.git#tag=${pkgver}")
# use makepkg -g to update
sha256sums=('96eded800ac6bfaef968fd52d250b7a6cc767f7297bb593a3a6dcd8ff0e32289')

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

