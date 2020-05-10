# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Que Quotion <quequotion@bugmenot.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero-git
pkgver=3.12.2.r88.g25824317
pkgrel=1
pkgdesc="CD/DVD mastering tool"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Brasero"
license=(GPL)
groups=(gnome-extra)
depends=(gtk3 gst-plugins-good totem-plparser cdrkit cdrdao shared-mime-info libcanberra
         dvd+rw-tools dconf libsm tracker libnotify gvfs)
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
source=("${pkgname%-git}::git+https://gitlab.gnome.org/GNOME/brasero.git/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname%-git}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${pkgname%-git}"
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
  cd "${pkgname%-git}"
  make DESTDIR=$pkgdir install
}

