# Contributor: Dave Reisner <d@falconindy.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=systemd-bootchart-git
pkgver=r35.0d42545
pkgrel=1
pkgdesc="Boot performance graphing tool"
arch=('i686' 'x86_64')
url="https://github.com/systemd/systemd-bootchart"
license=('LGPL2.1')
depends=('libsystemd.so')
makedepends=('git' 'intltool')
provides=('systemd-bootchart')
conflicts=('systemd-bootchart' 'systemd<=229')
source=("git://github.com/systemd/systemd-bootchart")
md5sums=('SKIP')
backup=('etc/systemd/bootchart.conf')

pkgver() {
  cd "systemd-bootchart"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "systemd-bootchart"

  ./autogen.sh
}

build() {
  cd "systemd-bootchart"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --libdir=/usr/lib

  make
}

package() {
  cd "systemd-bootchart"

  make DESTDIR="$pkgdir" install
}
