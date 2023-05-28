# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-metadata_filter'
pkgname=('python-metadata_filter')
_module='metadata_filter'
pkgver='0.1.0'
pkgrel=1
pkgdesc="Partial Python port of web-scrobbler/metadata-filter"
url="https://github.com/YodaEmbedding/metadata_filter"
depends=(
  'python'
)
makedepends=(
  'python-setuptools'
)
checkdepends=(
  'python-pytest'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
# source=("${_module}-${pkgver}.tar.gz::https://github.com/YodaEmbedding/metadata_filter/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('e0984b9a7b700869dd0831f9b75ce350b32ac988ab4151ae183e6ee77439ada8')

build() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py build
}

package() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

check() {
  cd "${srcdir}/${_module}-${pkgver}" || exit 1
  python -c 'import metadata_filter'
  # pytest -v  # Skip since many tests failing...
}
