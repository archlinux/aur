# Contributor: snakeroot <cwa AT pipeline DOT com>
# Maintainer: snakeroot <cwa AT pipeline DOT com>
pkgname='slimpris2'
pkgver=2.1.3
pkgrel=1
pkgdesc='MPRIS remote control of Logitech Media Server (Slimserver)'
arch=('any')
url='https://github.com/mavit/slimpris2'
license=('GPL3')
makedepends=('intltool' 'pandoc' 'perl>=5.8.1' 'systemd')
depends=('python>=3.6')
source=(slimpris2-2.1.3.tar.gz::"https://github.com/mavit/slimpris2/archive/refs/tags/${pkgver}.tar.gz")
md5sums=('c03e29915cef75530844016cfccc3c43')

build() {
  cd "$pkgname-$pkgver"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  rm /usr/lib/systemd/user-preset/80-slimpris2.preset
}
