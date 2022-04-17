# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=1.6
_rlsver=107
pkgrel=1
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell')
makedepends=('gnome-common')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

_commit=91f993df
source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/${_commit}/${_pkgbase}-${_commit}.tar.gz")
sha256sums=('44f7be2bf302c68dc4eafe2de3147b93887f4979bb300de6a2050cfab401bdb6')

build() {
  cd "${_pkgbase}-${_commit}"
  ./autogen.sh --prefix=/usr
  make GIT_VERSION="${_rlsver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR=${pkgdir} install
}
