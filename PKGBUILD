# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: JP-Ellis <josh@jpellis.me>

pkgname='python-habanero'
pkgver='1.2.6'
pkgrel=5
_name=${pkgname#python-}
_name="${_name//-/_}"
_src_folder="${_name}-${pkgver}"
pkgdesc="A low level client for Crossref's Search API"
url="https://github.com/sckott/habanero"
depends=(
  'python'
  'python-requests'
  'python-tqdm'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
optdepends=(
  'python-bibtexparser: attempt to fix misformatted bibtex'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('b206d49f44f41c2289f0ad731f259a50d4376c747d8ecbb219a73874d45309d4')

build() {
    cd "${srcdir}/${_src_folder}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}

# vim:set ts=2 sw=2 et:
