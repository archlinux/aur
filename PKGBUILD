# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: Link Dupont <link@subpop.net>

pkgname=leafpad
pkgver=0.8.18
pkgrel=2
pkgdesc="A notepad clone for GTK+ 2.0"
arch=('i686' 'x86_64')
url="http://tarot.freeshell.org/leafpad/"
license=('GPL')
depends=('gtk2')
makedepends=('intltool')
install=leafpad.install
source=(http://download.savannah.gnu.org/releases/${pkgname}/${pkgname}-${pkgver}.tar.gz
        cstr.patch)
md5sums=('9acb750a05161329a335c06889778be1'
         '5cb75143f6a5064cbbb8cc7957d22ebd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/cstr.patch"
  ./configure --prefix=/usr --enable-chooser
  make
  make DESTDIR="${pkgdir}" install
  echo 'StartupNotify=true' >> "${pkgdir}/usr/share/applications/leafpad.desktop"
}
