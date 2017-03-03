# $Id: PKGBUILD 272621 2016-07-28 17:33:46Z heftig $
# Maintainer: Allan McRae <allan@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=brasero
pkgver=3.12.1
pkgrel=2
pkgdesc="CD/DVD mastering tool"
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/Brasero"
license=(GPL)
options=(!emptydirs)
depends=(gtk3 gst-plugins-good totem-plparser cdrkit cdrdao shared-mime-info libcanberra
         dvd+rw-tools dconf libsm libtracker-sparql libnotify gvfs)
makedepends=(gtk-doc yelp-tools gnome-common intltool libburn libisofs libnautilus-extension
             gobject-introspection gconf itstool docbook-xsl)
optdepends=('libburn: alternative back-end'
            'libisofs: libburn back-end'
            'dvdauthor: video project'
            'vcdimager: video project')
replaces=(nautilus-cd-burner)
groups=(gnome-extra)
source=(https://download.gnome.org/sources/$pkgname/${pkgver:0:4}/$pkgname-$pkgver.tar.xz
        'dvdcss-nocheck.patch')
sha256sums=('9a5eea53e57b66de3c7c8c2393ac21a58d5afa81c6cfb16b3c7f010a3d147127'
            '98745ff68f16811bf9268799da33b9d94a50b37bb340c6c12af84186aa69b01c')

prepare() {
  cd $pkgname-$pkgver
  patch -Np2 < ../dvdcss-nocheck.patch 
  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-caches --disable-schemas-compile --enable-compile-warnings=minimum
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

