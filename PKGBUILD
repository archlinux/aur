# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=faac-git
pkgver=faac.1.50.r6.g167b5eb
pkgrel=1
pkgdesc="An MPEG-4 and MPEG-2 AAC encoder"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/faac/"
license=('LGPL-2.0-or-later')
depends=('glibc')
makedepends=('git' 'meson')
provides=("faac=$pkgver" 'libfaac.so')
conflicts=('faac')
source=("git+https://github.com/knik0/faac.git")
sha256sums=('SKIP')


pkgver() {
  cd "faac"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/[-_]/./g'
}

build() {
  cd "faac"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "faac"

  #meson test -C "_build"
}

package() {
  cd "faac"

  meson install -C "_build" --destdir "$pkgdir"
  install -Dm644 "COPYING" -t "$pkgdir/usr/share/licenses/faac"
}
