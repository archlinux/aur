# Maintainer: justbrowsing <developer4linux+aur@gmail.com>
# Contributer: Felix Yan <felixonmars@gmail.com>

pkgname=ibus-lite
_pkgname=ibus
pkgver=1.5.7
pkgrel=6
pkgdesc="ibus without python3"
arch=('i686' 'x86_64')
url="http://ibus.googlecode.com"
license=('LGPL')
depends=('libibus' 'dconf' 'gtk2' 'libnotify' 'iso-codes')
makedepends=('intltool' 'gnome-common' 'gconf')
optdepends=('vala: build vala bindings')
provides=('ibus=1.5.7')
conflicts=('ibus')
replaces=('ibus')
options=('!emptydirs')
install=ibus.install
source="https://github.com/ibus/ibus/archive/1.5.7.tar.gz"
md5sums=('98f57dbfca36b002b7b4df291f2f04cf')

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
