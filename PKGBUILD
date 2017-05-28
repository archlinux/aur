# Maintainer: Severen Redwood <severen@shrike.me>
# Contributors: Robert Welin <robert.welin@gmail.com>
#               dsboger <https://github.com/dsboger>
# Report all package issues to `https://github.com/SShrike/pkgbuilds`

pkgname='gtkd'
pkgver='3.6.4'
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
depends=('liblphobos' 'gtk3')
makedepends=('ldc')
optdepends=('pango' 'atk' 'gdk-pixbuf2' 'gtksourceview3' 'gstreamer' 'vte3' 'libpeas')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
sha512sums=('8b2a90c65814285128b7ccc9a5b89227589bc7b6e9cad0f7857624dad3175989487898f7d2ccecfb9772fabb5e55cf3f407f217533a4fe474a1910a8a5940ccb')

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
