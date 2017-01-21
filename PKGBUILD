# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.5.1'
pkgrel=2
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
depends=('liblphobos' 'gtk3')
makedepends=('ldc')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3' 'libpeas')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
sha512sums=('71fd514fc617a39c2aa970d02cb8e02ea017acda2bf3f5e24998f87c56718c4deb7b95128ead53ac50bc515b375f036c2b48576e1d74e7f320ee04b2b1d13c8a')

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
