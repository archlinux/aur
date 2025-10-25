# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=mwptools
pkgname=mwptools-git
pkgver=25.09.28.r14.cf1ae28b
pkgrel=1
pkgdesc='mission planner for INAV and MultiWii'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4' 'aarch64' 'riscv64')
url='https://codeberg.org/stronnag/mwptools'
license=('GPL-3.0-or-later')
makedepends=('git' 'vala' 'meson' 'go' 'blueprint-compiler')
depends=('gtk4' 'bluez' 'libgudev' 'gstreamer' 'cairo' 'pango' 'libxml2' 'vte4' 'mosquitto' 'libshumate' 'libadwaita'  'libepoxy' 'libsoup3' 'libsecret' 'sdl2-compat' 'readline')
optdepends=('blackbox-tools-git: Replay Blackbox files (AUR)'
 'gnuplot: Mission Elevation plots'
 'ruby: Various analysis tools'
 'paho-mqtt-c-git: Alternative MQTT library (AUR)'
 'espeak: speech synth'
 'espeak-ng-espeak: espeak alternative'
 'speech-dispatcher: espeak alternative'
 'flite: espeak alternative'
 'protobuf-c: enable protobuf-c for readsb/ADSB'
  )
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')
install=mwp.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd $_pkgname
  arch-meson build
  ninja -C build
}

package() {
  # executable
  cd $_pkgname
  DESTDIR="$pkgdir" ninja -C build install
}
