# Maintainer: Adam Mladý <admin@elevated.ovh>

pkgname=waycentral-git
pkgver=1.4.1_r0_gd8fbafa
pkgrel=1
pkgdesc="Centralized Program for Waybar Custom Modules (clock, updates, volume, music, network, GPU, tray, ...) with a C library"
arch=('x86_64' 'aarch64')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL-3.0-or-later')
depends=('glibc' 'pacman' 'curl' 'json-c' 'libpulse' 'systemd-libs' 'gtk3')
makedepends=('git' 'gcc' 'make' 'pkgconf')
optdepends=('hwdata: GPU names' 'nvidia-utils: NVIDIA GPU statistics')
provides=("waycentral=${pkgver%%_*}" 'libwaycentral.so')
conflicts=('waycentral')
source=("git+https://github.com/TheElevatedOne/waycentral#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd waycentral
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/_/g'
}

build() {
  cd waycentral
  make PREFIX=/usr release
}

package() {
  cd waycentral
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
