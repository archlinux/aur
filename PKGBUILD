# $Id$
# Maintainer: QuartzDragon <kyle[dot]devir[at]mykolab[dot]com>

pkgname=libretro-higan
_pkgname=higan
_repo=https://gitlab.com/higan/higan.git
_commit=886f6dcf42fa11656e0df82bad8fd5cfe6ac1035 # v106 on libretro branch
pkgver=106
pkgrel=2
pkgdesc='libretro core for Higan SNES'
arch=('x86_64')
url='http://byuu.org/'
license=('GPL3')
depends=('alsa-lib' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk2'
         'gtksourceview2' 'libao' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxv'
         'openal' 'pango' 'sdl'
         'libudev.so')
makedepends=('mesa')
provides=('libretro-higan')
source=("git+${_repo}#commit=${_commit}"
        'higan-flags.patch'
        'higan-paths.patch'
        'libretro.patch')
sha256sums=('SKIP'
            '6cff6f9570de186bdfa4620d3a2b6e315118b6f6be45b35f3346995865f1718e'
            '6d0bf69e00c9ea5c5155b52b5ee59c253f2bacbc64f044826f53d4d6ae175c68'
            '369fcf3e284b09e0ead3fa6c18c85240f656a42505f08c63da7cb636b9779160')

prepare() {
  cd ${srcdir}/${_pkgname}

  patch -Np1 -i ../higan-flags.patch
  patch -Np1 -i ../higan-paths.patch
  patch -Np1 -i ../libretro.patch
}

build() {
  cd ${srcdir}/${_pkgname}

  make -C higan target=libretro
}

package() {
  cd ${srcdir}/${_pkgname}

  install -Dm 755 higan/out/higan_sfc_libretro.so -t "${pkgdir}"/usr/lib/libretro/
}

# vim: ts=2 sw=2 et:
