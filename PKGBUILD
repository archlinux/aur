# Maintainer: krimson32 <krims0n32 omnomnom gmail.com>
# Contributor: krimson32 <krims0n32 omnomnom gmail.com>

_pkgname=xfce4-power-manager
pkgname=xfce4-power-manager-xbacklight
pkgver=1.4.4
pkgrel=1
pkgdesc="Power manager for Xfce desktop using xbacklight for setting brightness"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'upower' 'libnotify' 'hicolor-icon-theme' 'xorg-xbacklight')
optdepends=('xfce4-panel: for the Xfce panel plugin'
            'lxpanel: for the LXDE panel plugin')
makedepends=('intltool' 'xfce4-panel' 'lxpanel')
conflicts=('xfce4-power-manager')
install=$_pkgname.install
source=(http://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2 xbacklight.patch)
sha256sums=('c50ec8aa7e7848c57c0f856dceb8132eb5f37585f0ac1627459ab8c882c73b07'
            '9e03283b77d2afff7570e2187b064a1954a5a40a1fdb79a37436469b7c050afe')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i $srcdir/xbacklight.patch
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
