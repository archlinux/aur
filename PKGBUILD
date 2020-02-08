# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.27
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk")
source=("https://download.sourceforge.net/${pkgname}-editor/${pkgname}-${pkgver/\./}-source.tar.gz"
        "${pkgname}.patch")
md5sums=(
  "de518200b008f6bceda5bce66da47d5c"
  "fd239308e1594262d26692b54ab083a3"
)
sha1sums=(
  "296ac2bef8bcb4af5587097a8f3c0cf1ca8856bf"
  "2c6194833e886b3a2d968271d7a650b8b12b4231"
)
sha256sums=(
  "af77b887ca29353fe3d9fba5436e57f8beb2426fd60f26e3d14b2271d2d14ff3"
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
