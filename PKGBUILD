# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_py=python
_pkg=customtkinter
_pkgname="${_py}-${_pkg}"
_name="CustomTkinter"
pkgbase="${_pkg}"
pkgname=(
  "${_pkg}"
)
pkgver=5.2.0
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
  "${_py}"
  "${_py}-build"
  "${_py}-installer"
  "${_py}-wheel"
)
provides=(
  "${_pkgname}"
)
install=
changelog=
noextract=()
_pypi_repo="https://files.pythonhosted.org/packages/source"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
  # "${_pypi_repo}/p/${_pkg}/${_pkg}-${pkgver}.tar.gz"
)
sha512sums=(
  '88ce123b83fb6522c10d578e66ffbfe695a73aff91299edeaa38e0460dffb11109c3e04db1d93a655622a95aa6e10a850267f0e4ca97e15b00fe563ce8bf9c9d'
)

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  ${_py} -m build --wheel \
                  --no-isolation
}

package() {
  cd "${srcdir}/${_name}-${pkgver}"
  ${_py} -m installer --destdir="${pkgdir}" \
                      "dist/"*".whl"
  install -Dm 0644 \
	  "LICENSE" \
          "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set sw=2 sts=-1 et:
