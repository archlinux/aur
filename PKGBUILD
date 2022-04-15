# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

pkgname=gnome-shell-extension-openweather
_pkgbase=openweather
pkgver=1.5
_rlsver=107
pkgrel=2
pkgdesc="Display weather information for any location on Earth in the GNOME Panel"
arch=(any)
url="https://gitlab.com/skrewball/openweather"
license=(GPL3)
depends=('dconf' 'gnome-shell-extensions')
makedepends=('gnome-common')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

_commit=b5f1f5f8
source=("${_pkgbase}-v${pkgver}.tar.gz::${url}/-/archive/${_commit}/${_pkgbase}-${_commit}.tar.gz")
sha256sums=('61fa68f4e43e96bcf84aa87c7b29a1fa85cf14c48ade0ee9e95317c1c1fbb4bf')

build() {
  cd "${_pkgbase}-${_commit}"
  ./autogen.sh --prefix=/usr
  make GIT_VERSION="${_rlsver}"
}

package() {
  cd "${_pkgbase}-${_commit}"
  make DESTDIR=${pkgdir} install
}
