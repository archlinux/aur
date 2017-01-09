# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: TingPing <tingping@tingping.se>
#               Diego Cano <elkano@blep.org>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname=gtkd-git
pkgver=3.3.1.r1.7a4b7d7
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
url='http://gtkd.org/'
license=('LGPL')
arch=('x86_64' 'i686')
provides=('gtkd')
conflicts=('gtkd')
depends=('liblphobos' 'gtk3')
makedepends=('ldc') # LDC is currently required to build shared libs.
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3' 'peas')
source=('git://github.com/gtkd-developers/GtkD.git')
md5sums=('SKIP')

pkgver() {
  cd 'GtkD'

  git describe --long --tags | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd 'GtkD'

  LDFLAGS='' DC='ldc' make shared-libs shared-gstreamer shared-vte shared-peas
}

package() {
  cd 'GtkD'

  make prefix='/usr' DESTDIR="${pkgdir}/" \
    install-shared install-shared-gstreamer install-shared-vte install-shared-peas \
    install-headers install-headers-gstreamer install-headers-vte install-headers-peas
}

# vim:set ts=2 sw=2 et:
