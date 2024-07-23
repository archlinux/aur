# Maintainer: Vladyslav Marchenko <marlock@duck.com>

pkgname=wine64-ge-aarch64-bin
pkgver=8_26
pkgrel=1
epoch=3

_ver=${pkgver%_*}
_rev=${pkgver#*_}

source=(
    "https://github.com/GloriousEggroll/wine-ge-custom/releases/download/GE-Proton$_ver-$_rev/wine-lutris-GE-Proton$_ver-$_rev-x86_64.tar.xz"
    30-win32-aliases.conf
    wine64
)
sha512sums=(
    '3abd578ed45a16096843936e0258799450e6a5751bc67afaf8c58cd245c40e62794a89af25ae482d74d5ca2b7527d17ff77232781c6d9cf97bc02976c2f960bd'
    '6e54ece7ec7022b3c9d94ad64bdf1017338da16c618966e8baf398e6f18f80f7b0576edf1d1da47ed77b96d577e4cbb2bb0156b0b11c183a0accf22654b0a2bb'
    '270d622d1eb37fec34c566a6a2540c2c1cec1b969eef2ccdcfcdd0ddc29079fabb3549d13bc6cc92e81cde030cca50fd34479e0e492b90ab74aeecdd90c9e65a'
)

pkgdesc="A compatibility layer for running Windows programs - GloriousEggroll custom Wine build with Box64 dependency to run on aarch64 platform"
url="https://github.com/GloriousEggroll/wine-ge-custom"
arch=(aarch64)
options=(staticlibs !lto !strip)
license=(LGPL)

conflicts=(wine wine64)
provides=(wine wine64)

depends=(
  attr
  fontconfig
  libxcursor
  libxrandr
  libxi
  gettext
  freetype2
  gcc-libs
  libpcap
  desktop-file-utils
  box64
)

optdepends=(
  giflib
  gnutls
  v4l-utils
  libpulse
  alsa-plugins
  alsa-lib
  libxcomposite
  libxinerama
  opencl-icd-loader
  libva
  gtk3
  gst-plugins-base-libs
  vulkan-icd-loader
  sdl2
  sane
  libgphoto2
  ffmpeg
  cups
  samba
  dosbox
)

package() {
  mkdir -p "$pkgdir/opt/wine64-ge"
  cp -r "$srcdir/lutris-GE-Proton$_ver-$_rev-x86_64/." "$pkgdir/opt/wine64-ge/"
  install -m755 "$srcdir/wine64" "$pkgdir/usr/bin/wine64"
  ln -s wine64 "$pkgdir/usr/bin/wine"

  # Font aliasing settings for Win32 applications
  install -d "$pkgdir"/etc/fonts/conf.{avail,default}
  install -m644 "$srcdir/30-win32-aliases.conf" "$pkgdir/etc/fonts/conf.avail/30-wine-win32-aliases.conf"
  ln -s ../conf.avail/30-wine-win32-aliases.conf "$pkgdir/etc/fonts/conf.default/30-wine-win32-aliases.conf"
}
