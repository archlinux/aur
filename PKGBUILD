# Maintainer: Antonio Cardace <antonio@cardace.com>
pkgname=kmailapplet
pkgver=1.0.1
pkgrel=1
pkgdesc="A Mail Applet for the system tray to watch your Maildir box and get notifications whenever there's a new mail."
arch=('any')
url="https://github.com/ichigo663/KMailApplet"
license=('GPL3')
depends=('glibc' 'gcc-libs' 'boost-libs' 'qt5-base')
makedepends=('gcc' 'make' 'qt5-base' 'boost')
provides=("$pkgname")
conflicts=("$pkgname" "${pkgname}-git")
source=("https://github.com/ichigo663/KMailApplet/archive/v1.0.1.tar.gz")
md5sums=('7a5f329d4558d5cb31accd8906ca6fce')

build() {
  cd "$srcdir"
  tar -xf "v${pkgver}.tar.gz"
  cd "KMailApplet-${pkgver}"
  qmake -o Makefile build.pro
  make
}

package() {
  cd "$srcdir/KMailApplet-${pkgver}"
  cp -r usr etc $pkgdir
  chmod -R 755 "$pkgdir/usr" "$pkgdir/etc"
  mkdir -p "$pkgdir/usr/bin/"
  cp KMailApplet "$pkgdir/usr/bin/"
}
