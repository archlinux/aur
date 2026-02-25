# Maintainer: Vescrity <vescrity@foxmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>

_pkgname=calf
pkgname=calf-gui
pkgver=0.90.9
pkgrel=1
pkgdesc='LV2 plug-in suite and standalone Jack host - GUI enabled'
arch=(x86_64)
url='http://calf-studio-gear.org' # http only
_url="https://github.com/calf-studio-gear/calf"
groups=(lv2-plugins pro-audio)
license=(GPL-2.0-or-later LGPL-2.0-or-later)
depends=(cairo expat fluidsynth gcc-libs gdk-pixbuf2 glib2 glibc gtk2 hicolor-icon-theme jack)
makedepends=(cmake git lv2)
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+$_url#tag=$pkgver")
b2sums=('a62f3617959a73a0b0f23ef4976944f31d9c3bc37d14cf316eee428aa197cfda4e9ebccce12a17d733567523480c3c48d99ada05a0501c709f4f8ab6d2f22a77')

build() {
  cmake \
    -B build \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D WANT_EXPERIMENTAL=ON \
    -S $_pkgname \
    -W no-dev
  make -C build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 $_pkgname/{AUTHORS,ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$_pkgname"
}
