# Maintainer : dreieck

_pkgname=minitube
pkgname="${_pkgname}-bin"
pkgver=2.9
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player. Prebuilt binary with included Google API key."
arch=('x86_64')
url='https://flavio.tordini.org/minitube'
license=('GPL3')
install=minitube.install
depends=(
  'phonon-qt5'
  'qt5-declarative'
  'hicolor-icon-theme'
)
makedepends=(
  'archlinux-xdg-menu'
  'dpkg'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-google-api-key"
)
conflicts=(
  "${_pkgname}"
)
source=(
  "${_pkgname}.deb::http://flavio.tordini.org/files/${_pkgname}/${_pkgname}.deb"
  "${install}"
)
sha256sums=(
  'b9eaa42bf6a3242fb932c10db89d4d8b103b4fa4dfbcdc9b98e1927e166de26e' # minitube.deb
  'c7f4dd1ce7968635a0dbc44908a94e817e8ed6ab12d9443866ad28781038a25b' # minitube.install
)
noextract=(
  # "${_pkgname}.deb"
)

pkgver() {
  _ver="$(bsdtar -x -f "${srcdir}/control.tar.gz" -O control | grep -E '^Version:[[:space:]]+' | awk '{print $2}')"
  if [ -z ${_ver} ]; then
    echo "Error in 'pkgver()': Could not determine version." > /dev/stderr
    return 1
  fi
  echo "${_ver}"
}

package() {
  cd "${pkgdir}"
  bsdtar -x -v -f "${srcdir}/data.tar.xz"
  # dpkg-deb -X "${srcdir}/${_pkgname}.deb" "${pkgdir}"
}

