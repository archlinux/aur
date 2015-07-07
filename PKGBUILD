# Maintainer: ultraviolet <ultravioletnanokitty@gmail.com>

pkgname=iio-sensor-proxy-git
_pkgname="iio-sensor-proxy"
pkgver=r131.92ccf34
pkgrel=1
pkgdesc="IIO accelerometer sensor to input device proxy"
arch=('i686' 'x86_64')
url="https://github.com/hadess/iio-sensor-proxy"
license=('GPLv2+')
depends=('systemd' 'libgudev')
makedepends=('git' 'gtk-doc')
source=("git+https://github.com/hadess/iio-sensor-proxy.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="${pkgdir}" install
}
