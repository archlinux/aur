# Maintainer: Jonathan Hudson <jh+mwptools@daria.co.uk>

_pkgname=mwptools
pkgname=mwptools-git
pkgver=7.028.536.r5.45eb100f
pkgrel=1
pkgdesc='mission planner for iNav and MSP'
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'pentium4' 'aarch64' 'riscv64')
url='https://github.com/stronnag/mwptools'
license=('GPL-3.0-or-later')
makedepends=('git' 'vala' 'meson' 'go')
depends=('gtk3' 'gdl' 'libchamplain' 'clutter' 'bluez' 'libgudev' 'gstreamer' 'cairo' 'pango' 'libxml2' 'vte3' 'mosquitto' 'gst-plugins-base-libs' 'gst-plugins-good')
optdepends=('blackbox-tools-git: Replay Blackbox files (AUR)'
 'gnuplot: Mission Elevation plots'
 'ruby: Replay Blackbox logs'
 'paho-mqtt-c-git: Alternative MQTT library (AUR)'
 'espeak: speech synth'
 'espeak-ng-espeak: espeak alternative'
 'speech-dispatcher: espeak alternative'
 'flite: espeak alternative'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

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
