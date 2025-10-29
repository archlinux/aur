# Maintainer: Antonio Leal <antonioleal@yahoo.com>

pkgname=bwbasic
pkgver=3.40
pkgrel=1
pkgdesc="Bywater BASIC"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://sourceforge.net/projects/bwbasic"
license=('GPL-3.0-or-later')
depends=('xdg-utils' 'glibc')
makedepends=('dos2unix')
source=("https://sourceforge.net/projects/bwbasic/files/bwbasic/version%20${pkgver}/bwbasic-${pkgver}.zip")
md5sums=('5af04a96067672cea4b59a6acb7ae840')
sha256sums=('b5689422a09d05aae1143497d22579e55c4e121ee2b806e738b483b8c000a20f')

prepare() {
  mkdir -p "${pkgdir}"/usr/share/doc/$pkgname "${pkgdir}"/usr/share/pixmaps/$pkgname "${pkgdir}"/usr/share/applications/$pkgname
  cd "${srcdir}"
  dos2unix configure
  chmod +x configure
}

build() {
  cd "${srcdir}"
  gcc -o bwbasic -ansi -pedantic -Wall bw*.c -lm
}

package() {
  cd "${srcdir}"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
  install -Dm644 bwbasic.doc "${pkgdir}"/usr/share/doc/$pkgname/bwbasic.doc
  install -Dm644 DOCS/* "${pkgdir}"/usr/share/doc/$pkgname/
  install -Dm644 bwbasic.png "${pkgdir}"/usr/share/pixmaps/bwbasic.png
  install -Dm644 bwbasic.desktop "${pkgdir}"/usr/share/applications/bwbasic.desktop
}
