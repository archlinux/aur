pkgname=gupnp-tools
pkgver=0.8.12
pkgrel=1
pkgdesc="GUPnP Tools are free replacements of Intel UPnP tools that use GUPnP"
arch=('i686' 'x86_64')
url="http://www.gupnp.org/"
license=('GPL')
groups=('gupnp')
depends=('gupnp-av>=0.5.1' 'gtk3' 'gnome-icon-theme>=2.20' 'desktop-file-utils' 'gssdp>=0.7' 'gupnp>=0.13' 'intltool')
makedepends=('gtk-doc' 'pkgconfig')
options=('!libtool')
source=("https://download.gnome.org/sources/gupnp-tools/0.8/gupnp-tools-$pkgver.tar.xz" "missing-header.patch")
build() {
  patch $srcdir/$pkgname-$pkgver/src/av-cp/playlist-treeview.h missing-header.patch
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
}
package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install || return 1
}
md5sums=('b922a6839128e672b05720ee8b28cec5' '6cec7cacd086dccd0955023189ecc54f')

