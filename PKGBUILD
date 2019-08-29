# Maintainer : dreieck

_pkgname=minitube
pkgname="${_pkgname}-bin"
pkgver=3.1
pkgrel=1
pkgdesc="A native YouTube client in Qt. Watch YouTube videos without Flash Player. Prebuilt binary with included Google API key."
arch=('x86_64')
url='https://flavio.tordini.org/minitube'
license=('GPL3')
install=minitube.install
depends=(
  'mpv'
  'qt5-declarative'
  'qt5-x11extras'
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
  'e5140de6fb47b3670fdfd8f1c649226ec0685d2950fbac72b3ea1226bb5c0275' # minitube.deb
  'c7f4dd1ce7968635a0dbc44908a94e817e8ed6ab12d9443866ad28781038a25b' # minitube.install
)
noextract=(
  # "${_pkgname}.deb"
)

pkgver() {
  _ver="$(bsdtar -x -f "${srcdir}/control.tar.xz" -O control | grep -E '^Version:[[:space:]]+' | awk '{print $2}')"
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

