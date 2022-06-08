# Maintainer: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur

_pkgname=openweather
pkgname=gnome-shell-extension-openweather
pkgver=114
pkgrel=2
pkgdesc="Display weather information for any location on Earth in the GNOME Shell"
arch=('any')
url="https://gitlab.com/skrewball/openweather"
license=('GPL3')
depends=('dconf' 'gnome-shell')
conflicts=('gnome-shell-extension-openweather-git'
           'gnome-shell-extension-weather-git')

source=("${_pkgname}-v${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "commit-cb2b4b91.diff")
sha256sums=('0bfb5e6cc16e4a4117cd6c7bac16dd5afac8d7800d541e65de1c0d2bdfe5da73'
            'ae84bea0afdb242bc4f2e81e6ff8e9b95916e7039c7595faf2bb6c24be53c26c')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i ../commit-cb2b4b91.diff
}

build() {
  cd "${_pkgname}-v${pkgver}"
  make mergepo
}

package() {
  cd "${_pkgname}-v${pkgver}"
  make DESTDIR=${pkgdir} install
}
