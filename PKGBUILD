# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: 

_py=python
_pkg=customtkinter
_pkgname="${_py}-${_pkg}"
_name="CustomTkinter"
pkgbase="${_pkg}"
pkgname=(
  "${_pkg}"
)
pkgver=5.2.1
pkgrel=1
pkgdesc="A modern and customizable python UI-library based on Tkinter."
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
  arm
)
_ns="TomSchimansky"
url="https://github.com/${_ns}/${_pkg}"
license=(
  'MIT'
)
depends=(
  "${_py}"
  "${_py}-darkdetect"
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
  '39df0529db0c864c5bbedae1c1cba534fac8312fbd24d9569bcb624842bde619e221ab4ffb3204380840fe210fbca3b06d63a24f363f2bc639bc9c4917509a54'
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
