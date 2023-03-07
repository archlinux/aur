# Maintainer: libele <libele@disroot.org>

pkgname=bwbasic
pkgver=3.20
pkgrel=3
pkgdesc="Bywater BASIC"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://sourceforge.net/projects/bwbasic"
license=('GPL')
makedepends=('dos2unix')
source=("https://sourceforge.net/projects/bwbasic/files/bwbasic/version%20${pkgver}/bwbasic-${pkgver}.zip")
md5sums=('fd4bf69515e62d1c92aa3f47038d034b')

prepare() {
  mkdir -p "${pkgdir}"/usr/share/doc/$pkgname

  cd "${srcdir}"
  dos2unix configure
  chmod +x configure
}

package() {
  cd "${srcdir}"
  ./configure
  make

  cd "${srcdir}"
  install -Dm755 $pkgname "${pkgdir}"/usr/bin/$pkgname
  install -Dm644 README "${pkgdir}"/usr/share/doc/$pkgname/README
  install -Dm644 bwbasic.doc "${pkgdir}"/usr/share/doc/$pkgname/bwbasic.doc
  install -Dm644 DOCS/* "${pkgdir}"/usr/share/doc/$pkgname/
}
