# Maintainer: Nicholas Dahm <(first).(last) at gmail>

_pkgname=libxfce4ui
pkgname=${_pkgname}-move-monitor
pkgver=4.16.1
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk3' 'xfconf' 'libsm' 'startup-notification'
         'libgtop' 'libepoxy' 'hicolor-icon-theme')
provides=('libxfce4ui')
conflicts=('libxfce4ui')
makedepends=('intltool' 'gobject-introspection' 'vala')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2"
        "move-monitor-shortcuts.patch")
sha256sums=('d96946ae5af6bf078dda415419e0021909f763ee0020b42f3e26f603e51585f6'
            '26a0980d8ca0dae06a04740da90b27fc3b481f9ac6215720fcb7e1e9896e36d9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Add move monitor shortcuts
  patch -Np0 < ../../move-monitor-shortcuts.patch

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
