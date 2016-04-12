# $Id: PKGBUILD 194428 2013-09-16 10:38:02Z foutrelis $
# Maintainer:  Silvio Knizek <killermoehre@gmx.net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Contributor: Andrea De Angelis <andrea.deangelis93@gmail.com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-devel
pkgver=1.6.0
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('upower' 'libnotify' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'networkmanager' 'xfce4-panel' 'polkit')
optdepends=(
    'xfce4-panel:	for Xfce panel plugin support'
    )
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')
install=${_pkgname}.install
source=("http://archive.xfce.org/src/xfce/xfce4-power-manager/1.6/xfce4-power-manager-${pkgver}.tar.bz2")
sha1sums=('432e34cbd9e7f8e9ab2f81e3abb10ec7ed7b8c1f')
md5sums=('28e1ac260a6ea64ebc5f740c06d2a6b8')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

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
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
