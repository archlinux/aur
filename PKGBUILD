# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Jan de Groot <jan@jgc.homeip.net>

pkgbase=libgdamm
pkgname=(libgdamm libgdamm-docs)
pkgver=4.99.11
pkgrel=2
arch=('x86_64')
makedepends=('libgda' 'libsigc++' 'glibmm' 'glibmm-docs')
url="https://www.gtkmm.org/"
license=('LGPL')
options=('!emptydirs')
source=(https://ftp.gnome.org/pub/GNOME/sources/$pkgbase/${pkgver%.*}/$pkgname-$pkgver.tar.xz)
sha256sums=('e9820070a1b258fbdfa9b6583d97dfdb1340c90bb353c5f5e21522375609d0bb')

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
