# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.27
pkgrel=2
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk")
source=("https://download.sourceforge.net/${pkgname}-editor/${pkgname}-${pkgver/\./}-source.tar.gz"
        "${pkgname}.patch")
md5sums=(
  "93cbfeae354fe37769574bdd0f1e253f"
  "fd239308e1594262d26692b54ab083a3"
)
sha1sums=(
  "0bde0e4b2e0c4ee20c6633eceabb03d23db1c8db"
  "2c6194833e886b3a2d968271d7a650b8b12b4231"
)
sha256sums=(
  "42047fc8c684aeb6e609ad8d21bcd222010f69e8bb1ae286aa15d25e2a1d00b9"
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
