# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.3.1'
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url="http://gtkd.org/"
license=('LGPL')
options=('staticlibs')
depends=('liblphobos' 'gtk3')
makedepends=('ldc') # LDC is currently required to build shared libs.
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
md5sums=('ddf5476d978871f90009c432e264104f')

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
