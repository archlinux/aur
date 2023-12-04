# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=edddy
pkgname=${_pkgname}-git
pkgver=r194.5d17641
pkgrel=1
pkgdesc='Thee block-based map editor'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/tools/${_pkgname}"
license=('GPL2')
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
  qmake Edddy.pro "DATADIR=/usr/share"
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
