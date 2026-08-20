# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="python-pdbpp-git"
pkgver="0.12.1.r1.g93db837"
pkgrel="2"
pkgdesc="pdb++, a drop-in replacement for pdb"
arch=("any")
url="https://github.com/bretello/pdbpp"
license=("BSD")
depends=("python" "python-fancycompleter" "python-pygments")
makedepends=("git" "python-build" "python-installer" "python-setuptools" "python-setuptools-scm" "python-wheel")
options=(!emptydirs)
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver}")
source=("${pkgname%-*}::git+https://github.com/bretello/pdbpp.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}/${pkgname%-*}" || return
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname%-*}" || return
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname%-*}" || return
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
