# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>
# Contributor: Daniel Hahler <archlinux+aur@thequod.de>

pkgname="python-fancycompleter"
pkgver="0.11.1"
pkgrel="1"
pkgdesc="Colorful TAB completion for Python prompt"
arch=("any")
url="https://github.com/bretello/fancycompleter"
license=("BSD")
depends=("python")
makedepends=("python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
install="${pkgname}.install"
source=("https://github.com/bretello/fancycompleter/archive/${pkgver}.tar.gz")
sha256sums=("d3ecb03b907925782895adac39a125d4c50c89b5f5bf45902e203b77eeb9f260")

build() {
  cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
  SETUPTOOLS_SCM_PRETEND_VERSION_FOR_FANCYCOMPLETER="${pkgver}" \
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
