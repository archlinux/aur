# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=opensaucer
pkgname=${_pkgname}-git
pkgver=r304.a0dcf28
pkgrel=1
pkgdesc='Vehicular soccer'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/games/${_pkgname}"
license=('GPL-2.0-or-later' 'CC0-1.0' 'CC-BY-4.0' 'CC-BY-SA-4.0')
depends=('dry' 'sfml' 'qt5-base' 'hicolor-icon-theme')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('git')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  DRY_HOME=/opt/dry qmake OpenSaucer.pro "DATADIR=/usr/share"
  make
  qmake OpenEncounter.pro
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 saucer.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/saucer.svg
  install -Dm 755 saucer ${pkgdir}/usr/bin/saucer
  install -Dm 755 saucer-launcher ${pkgdir}/usr/bin/saucer-launcher
  install -Dm 755 saucer.desktop ${pkgdir}/usr/share/applications/saucer.desktop
  mkdir -p ${pkgdir}/usr/share/luckey/saucer
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/luckey/saucer/
}
