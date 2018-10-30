# Maintainer: Cody P Schafer <archlinux at codyps.com>
_bpn=paho-mqtt-c
pkgname=${_bpn}-git
pkgver=1.3.0.r0.g9f715d0
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
source=(
  "git+https://github.com/eclipse/paho.mqtt.c.git"
  "file://0001-make-pull-out-optimization-debug-flags.patch"
  "file://0002-make-make-all-dirs-required-in-install.patch"
  "file://533.patch"
)
md5sums=('SKIP'
         'f81bb7a9e9f20ae450676ab0f9843a5d'
         '740b4ec8e0632cd4757d104cae4c8cf9'
         '4981a9dc98cc1262a001ee0400e61d37')

pkgver() {
  cd "$srcdir/paho.mqtt.c"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/paho.mqtt.c"
  patch -Np1 <"$srcdir/533.patch"
  patch -Np1 <"$srcdir/0001-make-pull-out-optimization-debug-flags.patch"
  patch -Np1 <"$srcdir/0002-make-make-all-dirs-required-in-install.patch"
}

build() {
  cd "$srcdir/paho.mqtt.c"
  make prefix=/usr
}

package() {
  cd "$srcdir/paho.mqtt.c"
  make prefix=/usr DESTDIR="$pkgdir/" LDCONFIG=echo install
}

# vim:set ts=2 sw=2 et:
