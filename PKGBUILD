# Maintainer: Adam 'TheElevatedOne' Mladý <admin@elevated.ovh> -> https://github.com/TheElevatedOne

pkgname=wayweather-git
pkgver=3.0.1_r2_g79e881b
pkgrel=1
pkgdesc="Weather module for Waybar with saved locations, GPS/IP geolocation, a TUI and a C library"
arch=('x86_64' 'aarch64')
url="https://github.com/TheElevatedOne/wayweather"
license=('GPL-3.0-or-later')
depends=('glibc' 'curl' 'cjson' 'ncurses' 'geoclue' 'glib2')
makedepends=('git' 'gcc' 'make' 'pkgconf')
optdepends=('gpsd: GPS receiver support'
            'ttf-nerd-fonts-symbols: weather icons')
provides=("wayweather=${pkgver%%_*}" 'libwayweather.so')
conflicts=('wayweather' 'wayweather-bin')
source=("git+https://github.com/TheElevatedOne/wayweather#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd wayweather
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cd wayweather
  make PREFIX=/usr GEOCLUE=1 release
}

check() {
  cd wayweather
  make GEOCLUE=1 check
}

package() {
  cd wayweather
  make PREFIX=/usr GEOCLUE=1 DESTDIR="${pkgdir}" install
}
