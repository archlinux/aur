# -*- mode: shell-script -*-
# Maintainer: Manuel Reimer <mail+wine@m-reimer.de>

pkgname=wine-lol-bin
pkgver=7.14_1
pkgrel=1

_ver=${pkgver%_*}
_rev=${pkgver#*_}

source=(https://github.com/GloriousEggroll/wine-ge-custom/releases/download/$_ver-GE-$_rev-LoL/wine-lutris-ge-lol-$_ver-$_rev-x86_64.tar.xz
        30-win32-aliases.conf)
sha512sums=('5c3241aea22e679b7faac7dd29a2c591c98a93bc48ed894fe6e09074bf90d322421421c696ea6cf04db6730a68bc5fe0f15cc3ccd80d0c0b95143b3d00e2a91b'
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
  lcms2            lib32-lcms2
  libxml2          lib32-libxml2
  libxcursor       lib32-libxcursor
  libxrandr        lib32-libxrandr
  libxdamage       lib32-libxdamage
  libxi            lib32-libxi
  gettext          lib32-gettext
  freetype2        lib32-freetype2
  glu              lib32-glu
  libsm            lib32-libsm
  gcc-libs         lib32-gcc-libs
  libpcap          lib32-libpcap
  faudio           lib32-faudio
  desktop-file-utils
)

optdepends=(
  giflib                lib32-giflib
  libpng                lib32-libpng
  libldap               lib32-libldap
  gnutls                lib32-gnutls
  mpg123                lib32-mpg123
  openal                lib32-openal
  v4l-utils             lib32-v4l-utils
  libpulse              lib32-libpulse
  alsa-plugins          lib32-alsa-plugins
  alsa-lib              lib32-alsa-lib
  libjpeg-turbo         lib32-libjpeg-turbo
  libxcomposite         lib32-libxcomposite
  libxinerama           lib32-libxinerama
  opencl-icd-loader     lib32-opencl-icd-loader
  libxslt               lib32-libxslt
  libva                 lib32-libva
  gtk3                  lib32-gtk3
  gst-plugins-base-libs lib32-gst-plugins-base-libs
  vulkan-icd-loader     lib32-vulkan-icd-loader
  sdl2                  lib32-sdl2
  vkd3d                 lib32-vkd3d
  sane
  libgphoto2
  gsm
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
