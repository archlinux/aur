# Maintainer: David Runge <dvzrv@archlinux.org>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: speps <speps at aur dot archlinux dot org>
# Contributor: Max Pray a.k.a. Synthead <synthead@gmail.com>
# Contributor: clarence <catchfire at gmail dot com>

pkgname=patchage
pkgver=1.0.8
pkgrel=1
pkgdesc="A modular patch bay for audio and MIDI systems based on Jack and Alsa"
arch=(x86_64)
url="https://drobilla.net/software/patchage.html"
license=(GPL3)
depends=(atkmm gcc-libs glibc glibmm gtkmm)
makedepends=(alsa-lib boost dbus-glib ganv glib2 gtk2 jack libsigc++ meson)
options=(debug)
source=(https://download.drobilla.net/$pkgname-$pkgver.tar.xz{,.sig})
sha512sums=('af2e43c53ce80ab59416745e85cd7fc524fd3b21ae259d171f15998566cfa067a84a7406e78f5b50bc3ff339363b3ed9cacc9790f08cc6189e4919fc43d041dc'
            'SKIP')
b2sums=('d6bac04a3a6880c7758a01c60b4f4c907e7ae191ef8956fb6ad6f039d9bf40e973ff6e38fc6a5af5b4b4ce5386496282ab5cb06573b0e091e24b7c80fae73ac3'
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
  depends+=(libasound.so libatkmm-1.6.so libganv-1.so libgdk-x11-2.0.so
  libglibmm-2.4.so libglib-2.0.so libgobject-2.0.so libgtk-x11-2.0.so
  libjack.so libsigc-2.0.so)

  meson install -C build --destdir "$pkgdir"
  install -vDm 644 $pkgname-$pkgver/{AUTHORS,NEWS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
# vim:set ts=2 sw=2 et:
