# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>

pkgname=wine-lol-bin
pkgver=8_27
pkgrel=1
epoch=3

_ver=${pkgver%_*}
_rev=${pkgver#*_}

source=("https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton$_ver-$_rev-LoL/wine-lutris-GE-Proton$_ver-$_rev-LoL-x86_64.tar.xz"
        30-win32-aliases.conf)
sha512sums=('3d83d5b2658e0e09ce511113439b497f4276e9c4a3260309dbda46599b6b7aaa95b0f139863bac29cd5f8ebaa3600d56f3a4b6479833acf665040d2121346d48'
            '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb')

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll custom wine build for running League of Legends"
url="https://github.com/GloriousEggroll/wine-ge-custom"
arch=(x86_64)
options=(staticlibs !lto !strip)
license=(LGPL)

conflicts=("wine-lol")
provides=("wine-lol")


depends=(
  attr             lib32-attr
  fontconfig       lib32-fontconfig
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  desktop-file-utils
)

optdepends=(
  giflib                lib32-giflib
  gnutls                lib32-gnutls
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  sane
  libgphoto2
  ffmpeg
  cups
  samba           dosbox
)

install=wine.install

package() {
  mkdir -p "$pkgdir/opt/wine-lol"
  cp -r "$srcdir/lutris-GE-Proton$_ver-$_rev-LoL-x86_64/." "$pkgdir/opt/wine-lol/"

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.default/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
