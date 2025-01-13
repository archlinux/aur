# Maintainer: envolution
# Contributor: David Garfias <dgarfiasme at gmail dot com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=gfxstream
pkgdesc="Graphics Streaming Kit (colloquially known as Gfxstream) is a code generator that makes it easier to serialize and forward graphics API calls from one place to another."
license=("Apache-2.0")
pkgver=0.1.2
pkgrel=2
url="https://android.googlesource.com/platform/hardware/google/gfxstream/"
source=("git+https://android.googlesource.com/platform/hardware/google/gfxstream#tag=v${pkgver}-gfxstream-release")
arch=("x86_64")
sha256sums=('6a97a1762a3851076f8e844fd812a9b7c569ca931b1197eca0a2c402583b42c8')
makedepends=(
  meson
  git
  ninja
  clang
  vulkan-headers)
depends=(
  libaemu
  libglvnd
  mesa
  glu
  freeglut
  libdrm
  glm)

prepare() {
  cd "$pkgname"
  mkdir build
}

build() {
  cd "$pkgname"
  CC=clang CXX=clang++ arch-meson -Ddecoders=gles,vulkan,composer . build
  meson compile -C build
}
package() {
  cd "$pkgname"
  meson install -C build --destdir "$pkgdir"
}
# vim:set ts=2 sw=2 et:
