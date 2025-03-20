# Maintainer: Antonio Leal <antonioleal@yahoo.com>

pkgname=bwbasic
pkgver=3.30
pkgrel=1
pkgdesc="Bywater BASIC"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://sourceforge.net/projects/bwbasic"
license=('GPL-3.0-or-later')
depends=('xdg-utils' 'glibc')
makedepends=('dos2unix')
source=("https://sourceforge.net/projects/bwbasic/files/bwbasic/version%20${pkgver}/bwbasic-${pkgver}.zip")
md5sums=('a37262807cb7c497e6767bdfd704537d')
sha256sums=('09a6fcfc3bd88f0e8af1ce3a65324898849ad2f26de547850c1f994d255f9064')

prepare() {
  mkdir -p "${pkgdir}"/usr/share/doc/$pkgname "${pkgdir}"/usr/share/pixmaps/$pkgname "${pkgdir}"/usr/share/applications/$pkgname
  cd "${srcdir}"
  dos2unix configure
  chmod +x configure
}

build() {
  cd "${srcdir}"
  ./configure
  make
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
