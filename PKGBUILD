# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-midi-utilities
pkgname="${_pkgname}-git"
pkgver=r45.c912a95
pkgrel=1
pkgdesc="MIDI utility LV2 plugins from MOD Devices (git version)"
arch=('x86_64')
url="https://github.com/moddevices/mod-midi-utilities"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'lv2')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}::git+https://github.com/moddevices/mod-midi-utilities.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


build() {
  cd "${srcdir}/${_pkgname}"
  make PREFIX=/usr
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
}

# vim:set ts=2 sw=2 et:
