# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=mwptools
pkgname=mwptools-git
pkgver=r2238.58bffae
pkgrel=1
pkgdesc='mission planner for iNav and MSP'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4')
url='https://github.com/stronnag/mwptools.git'
license=('GPLv3')
makedepends=('git' 'vala')
depends=('gtk3' 'gdl' 'libchamplain' 'clutter' 'bluez' 'espeak' 'libgudev' 'gstreamer' 'cairo' 'pango' 'libxml2' 'vte3' 'mosquitto')
optdepends=('blackbox-tools-git: Replay Blackbox files (AUR)'
 'gnuplot: Mission Elevation plots'
 'ruby: Replay Blackbox logs'
 'go: Build otxlog (OpenTX log player)'
 'paho-mqtt-c-git: Alternative MQTT library (AUR)'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  make -j1
}

package() {
  # executable
  cd $_pkgname
  make -j1 DESTDIR="$pkgdir"  NOSCHEMAS=1 install
}
