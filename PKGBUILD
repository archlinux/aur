# Maintainer: anekos <anekos@snca.net>
pkgname=growl-for-linux
pkgver=0.8.1
pkgrel=1
pkgdesc="Growl for Linux"
url="http://mattn.github.com/growl-for-linux/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('git' 'openssl' 'curl' 'gtk2' 'sqlite3' 'dbus-glib' 'desktop-file-utils')
optdepends=('libnotify')
makedepends=()
conflicts=('growl-for-linux-git')
replaces=()
backup=()
options=('!libtool')


source=("$pkgname-$pkgver.tar.gz::https://github.com/mattn/growl-for-linux/archive/${pkgver}.tar.gz")
md5sums=('65b89ab4a5d7eeeb4ecc12fb26afcf32')
dirname="growl-for-linux-${pkgver}"

build () {
  cd "$srcdir/$dirname"

  export LDFLAGS="$LDFLAGS -lgmodule-2.0 -lgthread-2.0"
  export LIBNOTIFY_LIBS="-lnotify"
  ./autogen.sh
  ./configure --prefix=/usr && make
}

package () {
  cd "$srcdir/$dirname"
  echo $PWD
  make install DESTDIR="$pkgdir" prefix=/usr
}

# vim:set ts=2 sw=2 et:
