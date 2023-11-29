# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=mod-arpeggiator-lv2
pkgname=$_pkgname-git
pkgver=r117.82f3d9f
pkgrel=1
pkgdesc='A MIDI arpeggiator LV2 plugin from MOD Devices (git version)'
arch=(x86_64)
url="https://github.com/moddevices/mod-arpeggiator-lv2"
license=(GPL2)
groups=(lv2-plugins pro-audio)
depends=(glibc gcc-libs)
makedepends=(git lv2)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/moddevices/$_pkgname.git")
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
