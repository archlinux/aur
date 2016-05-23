# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=paho-mqtt-c
pkgname=${_bpn}-git
pkgver=1.0.3.r5.g07cd71b
pkgrel=1
pkgdesc="a fully fledged MQTT client written in ANSI standard C"
arch=(any)
url="https://www.eclipse.org/paho/clients/c/"
license=('EPL')
groups=()
depends=()
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=(git+https://github.com/eclipse/paho.mqtt.c.git)
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/paho.mqtt.c"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/paho.mqtt.c"
  make prefix=/usr
}

package() {
  cd "$srcdir/paho.mqtt.c"
  mkdir -p "$pkgdir/usr/lib"
  mkdir -p "$pkgdir/usr/bin"
  mkdir -p "$pkgdir/usr/include"
  make prefix=/usr DESTDIR="$pkgdir/" LDCONFIG=true install
}

# vim:set ts=2 sw=2 et:
