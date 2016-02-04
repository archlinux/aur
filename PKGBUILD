# Maintainer: Bernhard Landauer <oberon@manjaro.org>
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=indicator-application-gtk2
_pkgname=indicator-application
pkgver=12.10.0.1
pkgrel=2
pkgdesc="Indicator to take menus from applications and place them in the panel (GTK+ 2 library for Xfce/LXDE)"
arch=('i686' 'x86_64')
url="https://launchpad.net/indicators-gtk2"
license=('GPL')
depends=('indicator-application' 'libdbusmenu-gtk2' 'libindicator')
makedepends=('libappindicator')
options=('!libtool')
source=("https://launchpad.net/indicators-gtk2/$pkgname/i-a-$pkgver/+download/$_pkgname-$pkgver.tar.gz")
md5sums=('1d10bf69a026acd636f1b99d4cd7dce9')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  
  sed -i 's/-Werror//' {src,tests}/Makefile.{am,in}

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-static
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  make -C src DESTDIR="$pkgdir/" install-applicationlibLTLIBRARIES
}
