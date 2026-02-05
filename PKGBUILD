# Maintainer: ChoiHaram <altitudinem@google.com>
pkgname=libhinawa-git
pkgver=4.0.2.r0.g123456
pkgrel=1
pkgdesc="GObject introspection library for Linux FireWire subsystem (Git version)"
arch=('x86_64')
url="https://git.kernel.org/pub/scm/libs/ieee1394/libhinawa.git/"
license=('MIT')
depends=('glib2')
makedepends=('meson' 'gobject-introspection' 'gtk-doc' 'git')
provides=("libhinawa")
conflicts=("libhinawa")
source=("git+https://git.kernel.org/pub/scm/libs/ieee1394/libhinawa.git")
sha256sums=('SKIP')

pkgver() {
  cd "libhinawa"
  git describe --long --tags | sed 's/^libhinawa-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson "libhinawa" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 "libhinawa/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
