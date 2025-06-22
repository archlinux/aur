# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=luckeypark
pkgname=${_pkgname}-git
pkgver=r485.c246891
pkgrel=1
pkgdesc="It's just a ride"
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/games/park"
license=('GPL-3.0-or-later' 'CC0-1.0' 'CC-BY-3.0' 'CC-BY-4.0' 'CC-BY-SA-4.0')
depends=('dry' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git' 'qt5-base')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  DRY_HOME=/opt/dry qmake Park.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  mkdir -p ${pkgdir}/usr/share/luckey/${_pkgname}
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/luckey/${_pkgname}/
}
