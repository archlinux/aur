# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Michael Straube <michael.straube@posteo.de>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Valsu [arch(at)hylia.de]

pkgname=eureka
pkgver=1.24
pkgrel=1
pkgdesc="A map editor for the classic DOOM games"
arch=("i686" "x86_64")
url="http://${pkgname}-editor.sourceforge.net/"
license=("GPL2")
depends=("fltk")
source=("https://download.sourceforge.net/${pkgname}-editor/${pkgname}-${pkgver/\./}-source.tar.gz"
        "eureka.patch")
md5sums=("041e0870a34f0eb43a305e63f1dc32cd"
         "5b8ac3ea179cb63fd5351ca544000c57")
sha1sums=("c5c6374fec532d0903b45bc5ce5b806740d6cbc2"
          "c32826f72d026661881b619bed222bd0d1492979")
sha256sums=("75b47eedebc52b17d442988fa0f6e04987c80738defc1cda948db38b1b58312f"
            "a009bcd3618c0c3a9dcbb5f8162f25be82884d82f877b1db6106085b3e9e38c1")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  msg2 "Patching Makefile..."
  patch -p1 -i "../eureka.patch"
}


build() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  msg2 "Building..."
  make PREFIX=/usr OPTIMISE="$CXXFLAGS $CPPFLAGS"
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-source"

  msg2 "Packaging..."
  make PREFIX="${pkgdir}/usr" install

  msg2 "Installing icon, desktop file and man page"
  install -Dm644 "misc/eureka.xpm" "${pkgdir}/usr/share/pixmaps/eureka.xpm"
  install -Dm644 "misc/eureka.desktop" "${pkgdir}/usr/share/applications/eureka.desktop"
  install -Dm644 "misc/eureka.6" "${pkgdir}/usr/share/man/man6/eureka.6"
}
