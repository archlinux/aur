# Maintainer: ChoiHaram <altitudinem@google.com>
pkgname=libhitaki-git
pkgver=0.2.1.r0.g123456
pkgrel=1
pkgdesc="GObject introspection library for ALSA FireWire stack (Git version)"
arch=('x86_64')
url="https://github.com/alsa-project/libhitaki"
license=('MIT')
depends=('libhinawa' 'alsa-lib')
makedepends=('meson' 'gobject-introspection' 'git')
provides=("libhitaki")
conflicts=("libhitaki")
source=("git+https://github.com/alsa-project/libhitaki.git")
sha256sums=('SKIP')

pkgver() {
  cd "libhitaki"
  git describe --long --tags | sed 's/^libhitaki-//;s/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "libhitaki" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "libhitaki/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
