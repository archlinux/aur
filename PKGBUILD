# Maintainer: Vescrity <vescrity@foxmail.com>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: David Runge <dave@sleepmap.de>
# Contributor: Ray Rashif <schiv@archlinux.org>

_pkgname=calf
pkgname=calf-gui
pkgver=0.90.8
pkgrel=6
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
b2sums=('18b206958a945e47aa88e3097dfbc3ec960d163a26e4f23f2b239e58f2f4f71841b5e8cd5bac646e4adb8d37e60b232580edcc8a91bcc44b4a1f9a15ebfa2872')

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
