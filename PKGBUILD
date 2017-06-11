# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-settings
pkgname=${_pkgname}-devel
pkgver=4.13.0
pkgrel=2
pkgdesc="Settings manager for xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('exo>=0.11.0' 'garcon' 'libxfce4ui>=4.13' 'libnotify' 'libxklavier'
         'gnome-icon-theme' 'gtk-engines' 'dbus-glib')
makedepends=('intltool')
optdepends=('libcanberra: for sound control')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        "dbus_glib_fix.patch::https://git.xfce.org/xfce/xfce4-settings/patch/?id=570aa72683535eeedd0d15527f5c11f737ac150b")

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

sha256sums=('01a19a2d320617efc7de972069024f2a86255b8abf354fbd3698f361db75063d'
            'b31d0faa79f41b3637bb5a20a74424229b4374dbbcaa29e6753434ca0dad372a')
