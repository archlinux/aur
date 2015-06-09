# Maintainer: A.T.W.A. <arch.atwa@gmail.com>

pkgname=gtrayicon
pkgver=1.1
pkgrel=3
pkgdesc="A generic tray icon"
arch=('i686' 'x86_64')
url="http://gtrayicon.sourceforge.net"
license=('GPL3')
depends=('libglade')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('7d30a5b8558e8c600cf1ea4916c8adfc')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i -e 's|mkdir|mkdir -p|' \
    -e 's|-m 755 $(TARGET) $(INSTALL_PREFIX)/bin/|-Dm 755 $(TARGET) $(INSTALL_PREFIX)/bin/$(TARGET)|' Makefile
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make INSTALL_PREFIX="${pkgdir}/usr" install
}
