# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.27b
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk" "glu")
source=(
  "https://download.sourceforge.net/${pkgname}-editor/${pkgname}-${pkgver}-source.tar.gz"
  "${pkgname}.patch"
)
md5sums=(
  "ded6495c09e23bfe55513eb47abf17ea"
  "fd239308e1594262d26692b54ab083a3"
)
sha1sums=(
  "0ba0f2c30c1758722198c0dac99ca25e1143dd20"
  "2c6194833e886b3a2d968271d7a650b8b12b4231"
)
sha256sums=(
  "10d6ac1bd6cabb5ae8d19127de8bf725218d98fbe67bd016671b12c9c286f22b"
  "b4dfc71a004be7a08877005d71893488a92dbc17e4b1e13b80b75998d2950e69"
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"
  patch -p1 -i "../${pkgname}.patch"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"
  make PREFIX=/usr OPTIMISE="$CXXFLAGS $CPPFLAGS"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"
  make PREFIX="${pkgdir}/usr" install
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-source/misc/${pkgname}.xpm" "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-source/misc/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-source/misc/${pkgname}.6" "${pkgdir}/usr/share/man/man6/${pkgname}.6"
}
