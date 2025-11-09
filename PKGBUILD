# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: orumin <dev@orum.in>

_basename=libevdev
pkgname="lib32-$_basename"
pkgver=1.13.5
pkgrel=1
pkgdesc="Wrapper library for evdev devices (32-bit)"
arch=('x86_64')
url="https://www.freedesktop.org/wiki/Software/libevdev/"
license=(MIT)
depends=('lib32-glibc' "$_basename" 'lib32-check')
makedepends=('python' 'gcc-multilib' 'valgrind' 'doxygen' 'meson' 'lib32-gcc-libs')
source=(https://www.freedesktop.org/software/$_basename/$_basename-$pkgver.tar.xz)
sha512sums=('2ca066235c9d6729e965e2df1df192285b3d41a20aeb2bc4eb21d14dc469198d5270d1cd900dee0b6cf1bdf9efd3c47ec310bfbd9e4965b3bcc3ef440efba604')

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG="i686-pc-linux-gnu-pkg-config"

  arch-meson $_basename-$pkgver build \
    --libdir=/usr/lib32 \
    -D documentation=disabled
  meson compile -C build
}

check() {
  meson test -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  rm -rf "$pkgdir"/usr/{bin,share,include}
}
