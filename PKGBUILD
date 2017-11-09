# Maintainer: Que Quotion <quequotion@bugmenot.com>
# Maintainer: Allan McRae <allan@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero-dvdcssfix
pkgver=3.12.1
pkgrel=3
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
replaces=(nautilus-cd-burner)
groups=(gnome-extra)
source=(https://download.gnome.org/sources/brasero/${pkgver:0:4}/brasero-$pkgver.tar.xz
        'dvdcss-nocheck.patch')
sha256sums=('9a5eea53e57b66de3c7c8c2393ac21a58d5afa81c6cfb16b3c7f010a3d147127'
            'c6d7cbe8e1d1d77c7d6292f38d9feda75400b81a242897a3011d044a41acc009')

prepare() {
  cd brasero-$pkgver
  patch -Np2 < ../dvdcss-nocheck.patch 
  autoreconf -fi
}

build() {
  cd brasero-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-caches --disable-schemas-compile --enable-compile-warnings=minimum
  make
}

package() {
  cd brasero-$pkgver
  make DESTDIR=$pkgdir install
}

