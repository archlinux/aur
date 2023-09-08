# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=tux
pkgname=${_pkgname}-git
pkgver=r170.a33c631
pkgrel=1
pkgdesc='A 3D platform game featuring the famous Linux mascot.'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/games/${_pkgname}"
license=('GPL3' 'CC0' 'CC-BY-3.0' 'CC-BY-4.0' 'CC-BY-SA-4.0')
depends=('dry')
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
  rm -f Dry
  ln -s /opt/dry/ Dry
  qmake Tux.pro "DATADIR=/usr/share"
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
