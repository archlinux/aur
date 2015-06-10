# Matinainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jonathan Steel <mail at jsteel dot org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Contributor: boenki <boenki at gmx dot de>
# Contributor: sujith_m82 <m.sujith@gmail.com>

pkgname=consonance
pkgver=0.5.1
pkgrel=11
pkgdesc='Lightweight GTK+ music manager that aims to be fast, bloat-free and light on memory consumption'
arch=('i686' 'x86_64')
url='http://sites.google.com/site/consonancemanager'
license=('GPL')
depends=('curl' 'dbus-glib' 'desktop-file-utils' 'gtk2' 'libao' 'libmad'
         'libcdio-paranoia' 'libmodplug' 'libnotify' 'libsndfile' 'sqlite3'
         'taglib')
install=$pkgname.install
source=($url/releases-1/$pkgname-$pkgver.tar.gz
        libnotify.patch
        cdio-includes.patch)
md5sums=('2a195dd2314f7b65cc57cc871a4c5a47'
         'caa1e8b41723950fd926bfefccbbd8ac'
         '239b451ba8795f8c287e994a7e32d859')

build() {
  cd "$srcdir"/$pkgname-$pkgver

  patch -Np1 -i "$srcdir"/libnotify.patch
  patch -Np1 -i "$srcdir"/cdio-includes.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
