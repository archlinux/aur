# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=1.4
_rlsver=107
pkgrel=2
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('glib2' 'gettext' 'pkg-config' 'gnome-shell' 'gnome-icon-theme')
makedepends=('gnome-common' 'autoconf' 'automake' 'intltool')
conflicts=('gnome-shell-extension-openweather-git' 'gnome-shell-extension-weather-git')

_commit=2baadaa3
source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/${_commit}/${_pkgbase}-${_commit}.tar.gz")
sha256sums=('a0d2720fd9d7864435392134dffc227b8cfad5a99401866351baa6366bb6659f')

build() {
  cd "${_pkgbase}-${_commit}"
  ./autogen.sh --prefix=/usr
  make GIT_VERSION="${_rlsver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR=${pkgdir} install
}
