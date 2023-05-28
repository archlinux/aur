# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase='python-scrobblez'
pkgname=('python-scrobblez')
_module='scrobblez'
pkgver='0.1.1'
pkgrel=1
pkgdesc="Customizable last.fm scrobbler via MPRIS 2"
url="https://github.com/YodaEmbedding/scrobblez"
depends=(
  'python'
  'python-metadata_filter'
  'python-mpris2'
  'python-pylast'
  'python-pyxdg'
)
makedepends=(
  'python-setuptools'
)
checkdepends=(
  # 'python-pytest'
)
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/1e/91/b72873b29c8ae23113239b2f6201626c19d578b632bc11be683ac10ac7c0/scrobblez-0.1.1.tar.gz")
# PyPI refreshing...
# source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
# source=("${_module}-${pkgver}.tar.gz::https://github.com/YodaEmbedding/scrobblez/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('681e3a48036a49bde92f5d63ed6b4b7085ed64241c58834ae08c6bb6169bd87d')

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
  python -c 'import scrobblez'
}
