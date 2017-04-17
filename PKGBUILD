# Maintainer: twa022 <twa022 at gmail dot com>

# 0: no, 1: yes
_enable_polkit=1

_pkgname=xfce4-session
pkgname=${_pkgname}-devel
pkgver=4.13.0
pkgrel=2
pkgdesc="A session manager for Xfce"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'libwnck3' 'xorg-iceauth' 'xorg-xinit' 'hicolor-icon-theme')
makedepends=('intltool' 'xfce4-dev-tools')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4'
            'xlockmore: for locking screen with xflock4')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('3e02b124c6a282d9b1af0b30696d5256b1c2e56618992b49062314ed3ea5d3a1')

[[ ${_enable_polkit} -eq 1 ]] && depends+=( 'polkit' )

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug \
    --enable-systemd
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

