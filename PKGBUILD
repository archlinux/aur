# Maintainer:  Sascha Appel <sascha.appel@gmail.com>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Tobias Kieslich <tobias funnychar archlinux.org>
# Contributor: Andrea De Angelis <andrea.deangelis93@gmail.com>

_pkgname=xfce4-power-manager
pkgname=${_pkgname}-devel
pkgver=1.6.3
pkgrel=1
pkgdesc="Power manager for Xfce desktop"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('upower' 'libnotify' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('pkgconfig' 'intltool' 'xfce4-panel' 'polkit')
optdepends=(
    'xfce4-panel:	for Xfce panel plugin support'
    )
provides=("${_pkgname}=${pkgver}")
replaces=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!libtool')
install=${_pkgname}.install
source=("http://archive.xfce.org/src/xfce/xfce4-power-manager/1.6/xfce4-power-manager-${pkgver}.tar.bz2")
sha1sums=('ba9705efb9118b6bb320b9ebcd1b96f91e827d7e')
md5sums=('b5ed83dd7f30a54f95d1fae1c84fa33c')

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
