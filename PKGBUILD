# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Que Quotion <quequotion@bugmenot.com>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero-git
pkgver=3.12.2.r45.g6c45f9e7
pkgrel=1
pkgdesc="CD/DVD mastering tool"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Brasero"
license=(GPL)
options=(!emptydirs)
conflicts=('brasero')
provides=('brasero')
depends=(gtk3 gst-plugins-good totem-plparser cdrkit cdrdao shared-mime-info libcanberra
         dvd+rw-tools dconf libsm tracker libnotify gvfs)
makedepends=(gtk-doc yelp-tools gnome-common intltool libburn libisofs libnautilus-extension
             gobject-introspection gconf itstool docbook-xsl)
optdepends=('libburn: alternative back-end'
            'libisofs: libburn back-end'
            'dvdauthor: video project'
            'vcdimager: video project')
provides=(brasero)
conflicts=(brasero)
replaces=(nautilus-cd-burner)
groups=(gnome-extra)
source=("${pkgname}::git+https://gitlab.gnome.org/GNOME/brasero.git/")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${pkgname}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-caches --disable-schemas-compile --enable-compile-warnings=minimum
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR=$pkgdir install
}

