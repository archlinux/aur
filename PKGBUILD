# Maintainer: Mattias Andrée <m@`base64 -d`(bWFhbmRyZWU).se>
pkgbase=liblss16
pkgname=($pkgbase $pkgbase-utils)
pkgver=1.0
pkgrel=1
pkgdesc='C library for the SYSLINUX "ad hoc" LSS16 image format'
arch=(x86_64 aarch64)
url="https://codeberg.org/maandree/liblss16"
license=('custom:ISC')
depends=()
source=($pkgbase-$pkgver.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha256sums=(12367594c727e6cb46480ce73133ee33517c916e5f53e1489af6f70e7802e1f6)

build() {
  cd "${srcdir}/liblss16"
  make DESTDIR="${pkgdir}/" PREFIX=/usr
}

package_liblss16() {
  cd "${srcdir}/liblss16"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  rm -r -- "${pkgdir}/usr/bin"
  rm -r -- "${pkgdir}/usr/share/man/man1"
}

package_liblss16-utils() {
  pkgdesc="Utilties for converting images between PPM and LSS16 format"
  depends=(libquanta)
  conflicts=(syslinux)

  cd "${srcdir}/liblss16"
  make DESTDIR="${pkgdir}/" PREFIX=/usr install
  rm -r -- "${pkgdir}/usr/lib"
  rm -r -- "${pkgdir}/usr/include"
  rm -r -- "${pkgdir}/usr/share/man/man3"
  rm -r -- "${pkgdir}/usr/share/man/man5"
  rm -r -- "${pkgdir}/usr/share/man/man7"
}
