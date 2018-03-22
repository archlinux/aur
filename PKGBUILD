# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.13.2
pkgrel=1
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo>=0.11.0' 'garcon' 'libxfce4ui>=4.13' 'libnotify' 'libxklavier'
         'gnome-icon-theme' 'gtk-engines' 'dbus-glib' 'xfconf>4.13.0' 'upower')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('6ed1ef823fe4e26764064d7994fa4849d332cafaf1575784423035a95579a214')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-static \
    --enable-xrandr \
    --enable-xcursor \
    --enable-libnotify \
    --enable-libxklavier \
    --enable-pluggable-dialogs \
    --enable-sound-settings \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
