# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Que Quotion <quequotion@bugmenot.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero-git
pkgver=3.12.3.r29.g03844860
pkgrel=1
pkgdesc="CD/DVD mastering tool"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Brasero"
license=(GPL)
groups=(gnome-extra)
depends=(gtk3 gst-plugins-good totem-plparser cdrkit cdrdao shared-mime-info libcanberra
         dvd+rw-tools dconf libsm tracker3 libnotify gvfs)
makedepends=(gtk-doc yelp-tools gnome-common intltool libburn libisofs libnautilus-extension
             gobject-introspection itstool docbook-xsl git)
optdepends=('libburn: alternative back-end'
            'libisofs: libburn back-end'
            'dvdauthor: video project'
            'vcdimager: video project')
provides=(brasero)
conflicts=(brasero)
replaces=(nautilus-cd-burner)
options=(!emptydirs)
source=("git+https://gitlab.gnome.org/GNOME/brasero.git")
sha256sums=('SKIP')

pkgver() {
  cd brasero
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd brasero
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd brasero
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-caches \
    --disable-schemas-compile \
    --enable-compile-warnings=minimum
  make
}

package() {
  cd brasero
  make DESTDIR=$pkgdir install
}
