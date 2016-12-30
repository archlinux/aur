# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.4.0'
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
options=('staticlibs')
depends=('liblphobos' 'gtk3')
makedepends=('ldc') # LDC is currently required to build shared libs.
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
sha512sums=('dc2e806c84a91970e92026261e6855ac1a8bfa7c6a779da2e70be106722baa4d2ba94b24c26ac92401e02b6cca0fa5bb9a1266ee5f2604e8136978069d5e3eba')

build() {
  cd ${srcdir}/GtkD-${pkgver}

  LDFLAGS='' DC='ldc' make all
}

package() {
  cd ${srcdir}/GtkD-${pkgver}

  make prefix='/usr' DESTDIR="${pkgdir}/" install install-gstreamer \
    install-vte install-shared install-shared-gstreamer install-shared-vte
}

# vim:set ts=2 sw=2 et:
