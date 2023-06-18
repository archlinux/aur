# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=hexon
pkgname=${_pkgname}-git
pkgver=491.f160b5f
pkgrel=1
pkgdesc='heXon is a free and open source twin-stick-shooter created using the Dry game engine.'
arch=('any')
url="https://gitlab.com/luckeyproductions/games/${_pkgname}"
license=('GPL-2.0')
depends=('dry')
provides=("${_pkgname}")
makedepends=('git' 'gcc' 'make' 'qt5-base')
sha512sums=('SKIP')
source=("${pkgname}::git+${url}.git")

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  rm -f Dry
  ln -s /opt/dry/ Dry
  qmake heXon.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 hexon.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/hexon.svg
  install -Dm 755 hexon ${pkgdir}/usr/bin/hexon
  install -Dm 755 hexon.desktop ${pkgdir}/usr/share/applications/hexon.desktop
  mkdir -p ${pkgdir}/usr/share/luckey/hexon
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/luckey/hexon/
}
