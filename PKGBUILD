# Maintainer: Adam Mladý <admin@elevated.ovh>

pkgname=waycentral-git
pkgver=1.2.1_r1_gd2366a0
pkgrel=1
pkgdesc="Centralized Program for Waybar Custom Modules, with a C library (libwaycentral)"
arch=('x86_64' 'aarch64')
url="https://github.com/TheElevatedOne/waycentral"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
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
