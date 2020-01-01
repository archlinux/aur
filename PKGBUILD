# Contributor: qaz <fkxxyz@163.com>
pkgname=xfce4-mixer
pkgver=4.11.0
pkgrel=1
pkgdesc="A volume control application based on GStreamer"
arch=('i686' 'x86_64' 'mips64el' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://git.xfce.org/apps/xfce4-mixer/"
license=('GPL2')
depends=('xfce4-panel' 'gstreamer0.10-base-plugins>=0.10.25' 'libunique>=1.1')
makedepends=('xfce4-dev-tools')
source=(https://git.xfce.org/apps/xfce4-mixer/snapshot/$pkgname-$pkgver.tar.gz
	xfce4-mixer-dbus-glib.patch)

prepare() {
 cd "$srcdir/$pkgname-$pkgver"
 patch -Np1 -i "${srcdir}/xfce4-mixer-dbus-glib.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./autogen.sh --localstatedir=/var --prefix=/usr --sysconfdir=/etc
  make
}

package ()
{
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
sha256sums=('e3e8e8d304834bd2183d681c276e8d51cffb97a2feaad3472289b0c3e1de5267'
	    '12e3286f9093889a2bee7647e7ef9179eec0758f9c85f57faa3a9ec06c6db116')
