# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.24
pkgrel=2
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk")
source=("https://download.sourceforge.net/${pkgname}-editor/${pkgname}-${pkgver/\./}-source.tar.gz"
        "${pkgname}.patch")
md5sums=("690d64ea32b2b4bbe081e2c079936c1f"
         "d54b67edf77c3f9c14a30f5b17862cbb")
sha1sums=("78754c63bda8296627b185f62a6ec57e5c618a15"
          "dd0bdca256d4225b80addc9eb5ee333fc495b05a")
sha256sums=("3bb5a272b53a275f09c7fa5a29f417e257a7dc89d6689de45055a71fad6c91f4"
            "4ae5f645ffa9fe422a3a3f3c2892f2935815bf4d77d82481992f06ff3ac72946")

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
