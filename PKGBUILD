# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: Simon Tunnat <simon+aur@tunn.at>
# Contributor: anekos <anekos@snca.net>

pkgname=growl-for-linux
pkgver=0.8.5
pkgrel=2
pkgdesc="Growl for Linux"
url="http://mattn.github.com/growl-for-linux/"
arch=('i686' 'x86_64')
license=('BSD')
depends=('git' 'openssl' 'curl' 'gtk2' 'sqlite3' 'dbus-glib' 'desktop-file-utils')
makedepends=('autoconf' 'automake' 'm4')
optdepends=('libnotify')
conflicts=('growl-for-linux-git')
options=('!libtool')


source=("$pkgname-$pkgver.tar.gz::https://github.com/mattn/growl-for-linux/archive/${pkgver}.tar.gz")
sha256sums=('6af57c763d26e8bf985eb6ede5c2d2be9469c4f9254bdebcb168f0703dfb20fa')
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
