# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>

pkgname=wine-lol-bin
pkgver=p8_12
pkgrel=1
epoch=2

_ver=${pkgver%_*}
_rev=${pkgver#*_}

source=("https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-LOL-$_ver-$_rev/wine-lutris-ge-lol-$_ver-$_rev-x86_64.tar.xz"
        30-win32-aliases.conf)
sha512sums=('6e4c9a79d6d8255c7fe2de2081d39c4dace45fb27a21ddae8eb3789a191bde85bedbfee2e6a8bc227c4c578912dbf93ec860de649bed1b84038c3261b3a3af9c'
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
  cp -r "$srcdir/lutris-ge-lol-$_ver-$_rev-x86_64/." "$pkgdir/opt/wine-lol/"

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-lol-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-lol-win32-aliases.conf "$pkgdir/etc/fonts/conf.default/30-wine-lol-win32-aliases.conf"
}

# vim:set ts=8 sts=2 sw=2 et:
