# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=indicator-application
pkgver=12.10.0
pkgrel=2
pkgdesc="Indicator to take menus from applications and place them in the panel"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicator-application"
license=('GPL')
depends=('json-glib' 'dbus-glib' 'libappindicator3')
options=('!libtool')
source=(http://launchpad.net/$pkgname/${pkgver%.*}/$pkgver/+download/$pkgname-$pkgver.tar.gz)
md5sums=('0bbd45ee2f388580285c36dabd49caaf')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix build
  sed -i 's/-Werror//' {src,tests}/Makefile.{am,in}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-static
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}
