# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=1.4
_rlsver=1
pkgrel=1
pkgdesc="OpenWeather 2 displays weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('glib2' 'gettext' 'pkg-config' 'gnome-shell' 'gnome-icon-theme')
makedepends=('gnome-common' 'autoconf' 'automake' 'intltool')
conflicts=('gnome-shell-extension-openweather-git' 'gnome-shell-extension-weather-git')

_commit=ee408588
source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/${_commit}/${_pkgbase}-${_commit}.tar.gz")
sha256sums=('3364576ddc129cc5c3b042851b29fa8bcc2afc5c7abfc602a2567e55108d683d')

build() {
  cd "${_pkgbase}-${_commit}"
  ./autogen.sh --prefix=/usr
  make GIT_VERSION="${_rlsver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR=${pkgdir} install
}
