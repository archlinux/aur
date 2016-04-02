# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: TingPing <tingping@tingping.se>
#               Diego Cano <elkano@blep.org>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=gtkd-git
pkgver=r1258.4b67777
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
url='http://gtkd.org/'
license=('LGPL')
options=('staticlibs')
arch=('x86_64' 'i686')
provides=('gtkd')
conflicts=('gtkd')
depends=('liblphobos' 'gtk3')
makedepends=('ldc') # LDC is currently required to build shared libs.
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3')
source=('git://github.com/gtkd-developers/GtkD.git')
md5sums=('SKIP')

pkgver() {
  cd 'GtkD'

  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd 'GtkD'

  LDFLAGS='' DC='ldc' make all
}

package() {
  cd 'GtkD'

  make prefix='/usr' DESTDIR="${pkgdir}/" install install-gstreamer \
    install-vte install-shared install-shared-gstreamer install-shared-vte
}

# vim:set ts=2 sw=2 et:
