# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=edddy
pkgname=${_pkgname}-git
pkgver=r544.47a4461
pkgrel=1
pkgdesc='Thee block-based map editor'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/tools/${_pkgname}"
license=('GPL-2.0-or-later')
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
  DRY_HOME=/opt/dry/ qmake Edddy.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 ${_pkgname}.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_pkgname}.svg
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
  install -Dm 755 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/${_pkgname}.desktop
  mkdir -p ${pkgdir}/usr/share/luckey/${_pkgname}
  cp -R "${srcdir}/${pkgname}/EditorResources/." ${pkgdir}/usr/share/luckey/${_pkgname}/
}
