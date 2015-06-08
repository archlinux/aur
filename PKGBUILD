# Contributor: Johan "Slikkie" van der Slikke <johan@slikkie.nl>
# Maintainer: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=gexif
pkgver=0.5
pkgrel=3
pkgdesc='A GTK+ based GUI interface to libexif-gtk'
arch=('i686' 'x86_64')
url='http://libexif.sourceforge.net/'
license=('GPL')
depends=('libexif-gtk')
makedepends=('libexif-gtk')
source=("http://downloads.sourceforge.net/project/libexif/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        "gtk2-fix.patch"
        "gexif.desktop")
md5sums=("ad136a03e3e1a8d6d98211d94014df0c"
         "164f4d3d564c22b4e7ab401940236ca9"
         "6ce94402bf1799d3982fb879ae6bd3a9")

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -p1 < "${srcdir}"/gtk2-fix.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
  install -D -m644 "${srcdir}"/gexif.desktop "${pkgdir}"/usr/share/applications/gexif.desktop
}
