# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname=python-pdbpp
pkgver="0.12.1"
pkgrel="1"
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=("any")
url="https://github.com/bretello/pdbpp"
license=("BSD")
depends=("python" "python-fancycompleter" "python-pygments")
makedepends=("python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
options=(!emptydirs)
source=("https://github.com/bretello/pdbpp/archive/${pkgver}.tar.gz")
sha256sums=("c203fe7d3dca283324c15198ca85b79a5776529a9ba1ce652dd64df3f987343b")

build() {
  cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_PDBPP="${pkgver}" \
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
