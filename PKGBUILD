# Maintainer: Cody P Schafer <archlinux at codyps.com>
# Contributor: Martchus <martchus@gmx.net>

_bpn=paho-mqtt-c
pkgname=${_bpn}-git
pkgver=1.3.2.r3.g031a7b9
pkgrel=1
pkgdesc="A fully fledged MQTT client written in ANSI standard C"
arch=(any)
url="https://www.eclipse.org/paho/clients/c/"
license=('EPL')
groups=()
depends=()
makedepends=(git doxygen)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs !makeflags)
install=
source=(
  "git+https://github.com/eclipse/paho.mqtt.c.git"
  file://0001-make-pull-out-optimization-debug-flags.patch
  file://0002-make-make-all-dirs-required-in-install.patch
  file://0003-Fix-Makefile-install-target.patch
)
md5sums=('SKIP'
         '0e7b4c41a65be1732f8bb55fea73b083'
         '6a0500782fc9a5325aba7d37a7af21c7'
         'ab05e295452ab6ac96566cd9e36106c9')

pkgver() {
  cd "$srcdir/paho.mqtt.c"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/paho.mqtt.c"
  patch -Np1 <"$srcdir/0001-make-pull-out-optimization-debug-flags.patch"
  patch -Np1 <"$srcdir/0002-make-make-all-dirs-required-in-install.patch"
  patch -Np1 <"$srcdir/0003-Fix-Makefile-install-target.patch"
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
