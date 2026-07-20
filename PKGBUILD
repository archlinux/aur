# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=orchis-theme-all-git
_pkgname=orchis-theme
pkgver=2026.07.07.r0.29975e38
pkgrel=1
pkgdesc='Orchis is a [Material Design](https://material.io) theme for GNOME/GTK based desktop environments.'
arch=('x86_64')
url="https://github.com/vinceliuice/Orchis-theme"
license=('GPL-3.0')                                               # Change as needed
depends=('gtk3>=3.20' 'gnome-themes-extra' 'gtk-engine-murrine') # List dependencies
makedepends=('sassc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}" || exit 1
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  rm -rf "${srcdir}/build"
  mkdir "${srcdir}/build" || exit 1

 "${srcdir}/${pkgname}/install.sh" \
  -d "${srcdir}/build" \
  -t all \
  -i arch
}
package() {
  mkdir -p "${pkgdir}/usr/share/themes" || exit 1

  cp -a "${srcdir}/build/." "${pkgdir}/usr/share/themes/"
}
