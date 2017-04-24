# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.6.1'
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
depends=('liblphobos' 'gtk3')
makedepends=('ldc')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3' 'libpeas')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
sha512sums=('e2b476ccc53177bd123275946ade42a918a2e9943894df23dce815d36cffb1922966ed1f6e6f749f09d0ba5f61f45408dcb26badb83228841bdca750e29f8c10')

build() {
  cd ${srcdir}/GtkD-${pkgver}

  LDFLAGS='' DC='ldc' make libdir='lib/' shared-libs shared-gstreamer shared-vte shared-peas
}

package() {
  cd ${srcdir}/GtkD-${pkgver}

  make prefix='/usr' libdir='lib/' DESTDIR="${pkgdir}/" \
    install-shared install-shared-gstreamer install-shared-vte install-shared-peas \
    install-headers install-headers-gstreamer install-headers-vte install-headers-peas
}

# vim:set ts=2 sw=2 et:
