# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_py=python
_pkg=customtkinter
_pkgname="${_py}-${_pkg}"
_name="CustomTkinter"
pkgbase="${_pkg}-git"
pkgname=(
  "${pkgbase}"
)
pkgver=v5.2.0+7+gd719950
pkgrel=1
pkgdesc="A modern and customizable python UI-library based on Tkinter."
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
_ns="TomSchimansky"
url="https://github.com/${_ns}/${_pkg}"
license=(
  'MIT'
)
depends=(
  "${_py}"
  "tk"
)
makedepends=(
  "git"
  "${_py}"
  "${_py}-build"
  "${_py}-installer"
  "${_py}-wheel"
)
provides=(
  "${_pkgname}"
  "${_pkg}"
)
conflicts=(
  "${_pkg}"
)
install=
changelog=
noextract=()
source=(
  "${_pkg}::git+${url}.git"
  # "${_pypi_repo}/p/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkg}"
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd "${srcdir}/${_pkg}"
  ${_py} -m build --wheel \
                  --no-isolation
}

package() {
  cd "${srcdir}/${_pkg}"
  ${_py} -m installer --destdir="${pkgdir}" \
                      "dist/"*".whl"
  install -Dm 0644 \
	  "LICENSE" \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
