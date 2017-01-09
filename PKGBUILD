# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.5.0'
pkgrel=2
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
options=('staticlibs')
depends=('liblphobos' 'gtk3')
makedepends=('ldc') # LDC is currently required to build shared libs.
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3' 'libpeas')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
sha512sums=('6c083790999737ebfb969101717d88edd4355b1746b74b0c86986be4890d8551c0359266fbcd27a72040879b0c5ab99087e438ab0a7e54f883d8cd8edd85c789')

build() {
  cd ${srcdir}/GtkD-${pkgver}

  LDFLAGS='' DC='ldc' make all
}

package() {
  cd ${srcdir}/GtkD-${pkgver}

  make prefix='/usr' DESTDIR="${pkgdir}/" install install-gstreamer \
    install-vte install-peas install-shared install-shared-gstreamer \
    install-shared-vte install-shared-peas
}

# vim:set ts=2 sw=2 et:
