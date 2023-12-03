# Maintainer : MorsMortium <morsmortium@disroot.org>

_pkgname=opensaucer
pkgname=${_pkgname}-git
pkgver=r118.3e0306b
pkgrel=1
pkgdesc='Mutiny on the mothership'
arch=('x86_64')
url="https://gitlab.com/luckeyproductions/games/${_pkgname}"
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
  qmake OpenSaucer.pro "DATADIR=/usr/share"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm 644 saucer.svg ${pkgdir}/usr/share/icons/hicolor/scalable/apps/saucer.svg
  install -Dm 755 saucer ${pkgdir}/usr/bin/saucer
  install -Dm 755 saucer.desktop ${pkgdir}/usr/share/applications/saucer.desktop
  mkdir -p ${pkgdir}/usr/share/luckey/saucer
  cp -R "${srcdir}/${pkgname}/Resources/." ${pkgdir}/usr/share/luckey/saucer/
}
