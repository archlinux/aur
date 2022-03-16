# Maintainer: Paul Bell <linux at dpb dot org dot uk>
# Contributor: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gtrayicon
pkgver=1.1
pkgrel=5
pkgdesc="A user configurable GTK2 status icon and menu for the system tray (notification area)"
arch=('i686' 'x86_64')
url="http://gtrayicon.sourceforge.net/"
license=('GPL3')
depends=('libglade')
makedepends=('libglade')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('f29f702b97ee8a1e2d29c4a1c8f7b484b5ca588e3c25ff8242bcc920d7b98911')

prepare() {
  sed -i 's#INSTALL_PREFIX = /usr#INSTALL_PREFIX = $(DESTDIR)/usr#' "${srcdir}/${pkgname}-${pkgver}/Makefile"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -dm755 "${pkgdir}"/usr/{bin,share/doc,share/man/man1}
  make DESTDIR="${pkgdir}/" install
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
  install -Dm644 {README,ChangeLog} -t "${pkgdir}"/usr/share/doc/"${pkgname}"
  install -Dm644 sample.menu -t "${pkgdir}"/usr/share/doc/"${pkgname}"/examples
  rm "${pkgdir}/usr/share/${pkgname}"/{README,ChangeLog,LICENSE,sample.menu}
  install -Dm644 Debian/"${pkgname}".1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
