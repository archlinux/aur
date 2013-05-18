# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jan@jgc.homeip.net>

pkgbase=libgdamm
pkgname=(libgdamm libgdamm-docs)
pkgver=4.99.7
pkgrel=1
arch=('i686' 'x86_64')
makedepends=('libgda' 'libsigc++' 'glibmm' 'glibmm-docs')
url="http://www.gtkmm.org/"
license=('LGPL')
options=('!libtool' '!emptydirs')
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgbase/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('5b864ddc7d5555c6c2d7fb5c6a3856c690911d12837148511a7b9f85100ca06c')

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
