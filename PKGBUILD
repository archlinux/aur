# Maintainer: Davi da Silva Böger <dsboger at gmail dot com>

pkgname='gtkd-dmd'
pkgver='3.3.1'
pkgrel=1
pkgdesc='D bindings for GTK+ and related libraries.'
arch=('x86_64' 'i686')
url='http://gtkd.org/'
license=('LGPL')
depends=('libphobos' 'gtk3')
makedepends=('dmd')
optdepends=('gtksourceview3' 'gstreamer' 'vte3')
source=("https://github.com/gtkd-developers/GtkD/archive/v${pkgver}.tar.gz")
md5sums=('ddf5476d978871f90009c432e264104f')

prepare() {
  cd ${srcdir}/GtkD-${pkgver}

  # Avoid conflicts with other gtkd packages
  sed -i 's#-$(MAJOR)#-$(MAJOR)-dmd#g' GNUmakefile
}

build() {
  cd ${srcdir}/GtkD-${pkgver}

  LDFLAGS='' make DC='dmd' DCFLAGS='-O -release -inline' \
    shared-libs \
    shared-gstreamer \
    shared-vte
}

package() {
  cd ${srcdir}/GtkD-${pkgver}

  make prefix='/usr' DESTDIR="${pkgdir}/" \
    install-shared \
    install-shared-gstreamer \
    install-shared-vte \
    install-headers \
    install-headers-gstreamer \
    install-headers-vte
}

# vim:set ts=2 sw=2 et:
