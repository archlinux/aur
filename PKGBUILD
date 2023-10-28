# Maintainer: libele <libele@disroot.org>

pkgname=bwbasic
pkgver=3.20
pkgrel=4
pkgdesc="Bywater BASIC"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://sourceforge.net/projects/bwbasic"
license=('GPL')
makedepends=('dos2unix')
source=("https://sourceforge.net/projects/bwbasic/files/bwbasic/version%20${pkgver}/bwbasic-${pkgver}.zip")
md5sums=('fd4bf69515e62d1c92aa3f47038d034b')
sha256sums=('ee18eefab7ed91ad1ad50ccab33eb038c4abd753595e19982890867f282339f1')

prepare() {
  mkdir -p "${pkgdir}"/usr/share/doc/$pkgname

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
}
