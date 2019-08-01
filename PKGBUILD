# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Sascha Appel <sascha.appel@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Contributor: Andrea De Angelis <andrea.deangelis93@gmail.com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-devel
pkgver=1.6.4
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('upower' 'libnotify' 'libxfce4ui' 'hicolor-icon-theme' 'networkmanager')
makedepends=('pkgconfig' 'intltool' 'xfce4-panel' 'polkit')
optdepends=('xfce4-panel:	for Xfce panel plugin support')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/xfce4-power-manager/1.6/xfce4-power-manager-${pkgver}.tar.bz2")
sha256sums=('078df808e68f745769b4c34a4719cfe289d4bf89ca2cd4ed4680f2551a00039e')

build() {
  cd "$srcdir/${_pkgname}-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --enable-network-manager \
    --enable-polkit \
    --disable-debug
  make
}

package() {
  cd "$srcdir/${_pkgname}-$pkgver"
  make DESTDIR="$pkgdir" install
}
