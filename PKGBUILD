# Maintainer: Allan McRae <allan@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Spyros Stathopoulos <foudault.online@gmail.com>

pkgname=brasero2
_pkgname=brasero
pkgver=2.32.1
pkgrel=4
pkgdesc="A disc burning application for Gnome"
arch=('i686' 'x86_64')
url="http://www.gnome.org/projects/brasero"
license=('GPL')
options=('!libtool' '!emptydirs')
depends=('gtk2' 'gstreamer0.10-base-plugins' 'totem-plparser' 'cdrkit' 'cdrdao' 'desktop-file-utils' 'hicolor-icon-theme' 'libunique'  'libcanberra' 'dvd+rw-tools' 'dconf' 'libsm' 'libsoup-gnome')
makedepends=('gtk-doc' 'intltool' 'libburn' 'libisofs' 'gobject-introspection' 'gconf')
optdepends=('libburn: alternative back-end'
            'libisofs: libburn back-end'
            'dvdauthor: video project'
            'gstreamer0.10-bad-plugins: video project'
            'vcdimager: video project')
replaces=('nautilus-cd-burner')
provides=('brasero')
conflicts=('brasero')
install=brasero.install
source=(http://ftp.gnome.org/pub/gnome/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('7b1056b6f19398912d51e3e583bc1b4d2a75ce2a8e15a96e1514fe6edb79df3b')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-caches \
      --disable-schemas-compile \
      --disable-search
  make LDFLAGS="$LDFLAGS -lICE"
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR=${pkgdir} install
}
