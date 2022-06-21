# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=openweather
pkgname=gnome-shell-extension-openweather
pkgver=116
pkgrel=2
pkgdesc="Display weather information for any location on Earth in the GNOME Shell"
arch=('any')
url="https://gitlab.com/skrewball/openweather"
license=('GPL3')
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "patch-prefs-background-refresh.diff")
sha256sums=('8c7735b2961a5c4ce0dc326ea7cacb2544282686ca2f8b7e26ee71ba90771c67'
            '2e6db5dce74efa1801f67e064f8406c96aca5ac2415b0e5e667f674691c600cb')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i ../patch-prefs-background-refresh.diff
}

build() {
  cd "${_pkgname}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgname}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
