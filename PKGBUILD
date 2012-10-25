# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jan@jgc.homeip.net>

pkgbase=libgdamm
pkgname=(libgdamm libgdamm-docs)
pkgver=4.99.6
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('libgda' 'libsigc++' 'glibmm' 'glibmm-docs')
url="http://www.gtkmm.org/"
license=('LGPL')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgbase/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('d1b7e5101c192695e1fad96f6371d4c2362adb3e8f452f2cb2c89e4380d4f492')

build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package_libgdamm() {
  pkgdesc="C++ bindings for libgda"
  depends=('libgda' 'glibmm' 'libsigc++')
  cd "${srcdir}/${pkgbase}-${pkgver}"

  sed -i -e 's/^doc_subdirs/#doc_subdirs/' Makefile

  make DESTDIR="${pkgdir}" install
}

package_libgdamm-docs() {
  pkgdesc="Developer documentation for libgdamm"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  make -C docs DESTDIR="${pkgdir}" install
}
