# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.10
pkgrel=2
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=(x86_64)
url="https://drobilla.net/software/patchage.html"
license=(GPL3)
depends=(
  gcc-libs
  glibc
  gtkmm
  hicolor-icon-theme
)
makedepends=(
  alsa-lib
  atkmm
  boost
  dbus-glib
  ganv
  glib2
  glibmm
  gtk2
  jack
  libsigc++
  meson
)
source=(https://download.drobilla.net/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('c6c43afc50978db02517282c1e8c7aad131e30f6255e79e65ea17edcee0b470ec3172da2c057abe4cf4bb12a081a92165ac322cfc4ec77382bb992e74827831b'
            'SKIP')
b2sums=('db7e17acc483b1fec27c80a3bedf3b546d303d8ce4f90f7f7669a4e4e1dcb526881d949d91edfdd6283dff3d9382c4c3534972065e2769a43e9e4b982b0dfbec'
        'SKIP')
validpgpkeys=('907D226E7E13FA337F014A083672782A9BF368F3') # David Robillard <d@drobilla.net>

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  depends+=(
    alsa-lib libasound.so
    atkmm libatkmm-1.6.so
    ganv libganv-1.so
    glibmm libglibmm-2.4.so
    glib2 libglib-2.0.so libgobject-2.0.so
    gtk2 libgtk-x11-2.0.so
    jack libjack.so
    libsigc++ libsigc-2.0.so
  )

  meson install -C build --destdir "$pkgdir"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
