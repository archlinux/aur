# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
# Contributer: Felix Yan <felixonmars@gmail.com>

pkgname=ibus-lite
_pkgname=ibus
pkgver=1.5.13
pkgrel=1
pkgdesc="ibus without python3"
arch=('i686' 'x86_64')
url="http://ibus.googlecode.com"
license=('LGPL')
depends=('libibus' 'dconf' 'gtk2' 'libnotify' 'iso-codes')
makedepends=('intltool' 'gnome-common' 'gconf' 'vala')
provides=("ibus=$pkgver")
conflicts=('ibus')
replaces=('ibus')
options=('!emptydirs')
install=ibus.install
source=("https://github.com/ibus/ibus/archive/${pkgver}.tar.gz")
md5sums=('5d80ef4ad6a88a1b3e048d894f1e56bf')

build() {
  cd "$srcdir/ibus-$pkgver"
  ./autogen.sh \
    --prefix=/usr \
    --libexecdir=/usr/lib/ibus \
    --sysconfdir=/etc \
    --disable-gconf \
    --enable-dconf \
    --enable-wayland \
    --disable-gtk-doc \
    --disable-memconf \
    --enable-ui \
    --enable-python-library \
    --with-python=python2
  make
}

package() {
  cd "$srcdir/ibus-$pkgver"
  make DESTDIR="${pkgdir}" install
  make -C src DESTDIR="${pkgdir}" uninstall
  make -C bindings DESTDIR="${pkgdir}" uninstall
  make DESTDIR="${pkgdir}" uninstall-pkgconfigDATA
}
