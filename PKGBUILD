# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupd
pkgver=0.7.2
pkgrel=1
pkgdesc='A simple daemon to allow session software to update firmware'
arch=('i686' 'x86_64')
url='https://github.com/hughsie/fwupd'
license=('GPL2')
depends=('appstream-glib>=0.5.2' 'fwupdate')
makedepends=('intltool' 'perl-xml-sax-expat' 'gtk-doc' 'docbook-utils' 'docbook-sgml' 'openjade' 'opensp' 'perl-sgmls')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('4efb2e7b052af9b60dea29a74233ae70ce796b5ab4a42c2e0fb8d790e7e64976')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  ./autogen.sh --prefix=/usr \
               --sysconfdir=/etc \
               --localstatedir=/var \
               --libexecdir=/usr/lib/fwupd \
               --enable-colorhug \
               --enable-uefi \
               --enable-fwsignd \
               --disable-rpath
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}
