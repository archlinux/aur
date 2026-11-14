# Maintainer: Shira Nguyen <sn3446409@gmail.com>

_pkgname=dwproton
pkgname=${_pkgname}-bin
_srcver=11.0-17
pkgver=${_srcver//-/_}
pkgrel=2
epoch=1
pkgdesc="Proton builds with the latest Dawn Winery fixes for gacha games, based on Proton-CachyOS."
arch=('x86_64')
url="https://dawn.wine/dawn-winery/dwproton"
license=('BSD-2-Clause' 'LGPL-2.1-only' 'Zlib' 'MIT' 'MPL-2.0' 'custom')
options=(!strip emptydirs)
provides=('proton' 'dwproton')
_srcdir="${_pkgname}-${_srcver}-${CARCH}"
source=("${url}/releases/download/${_pkgname}-${_srcver}/${_srcdir}.tar.xz")
sha512sums=('4cba612f9e4ba0cf6c8bcc5349f319d07b19fdf4699180215c73d0ac8ffe59a0d0325713b74d1e5d43af1a52e0fd3f2be8bf404898b90a314847c113f46488a8')
depends=(
  bash
  coreutils
  curl
  dbus
  desktop-file-utils
  diffutils
  freetype2
  gcc-libs
  gdk-pixbuf2
  glibc
  hicolor-icon-theme
  jsoncpp
  lapack
  libogg
  libpulse
  libvdpau
  libvorbis
  libxcrypt
  libxcrypt-compat
  libxkbcommon-x11
  lsb-release
  lsof
  mpg123
  nettle3
  nss
  ntsync-autoload
  opus
  python
  rtkit
  ttf-font
  usbutils
  vulkan-driver
  vulkan-icd-loader
  xdg-user-dirs
  xorg-xrandr
  xz
)
depends_x86_64=(
  lib32-alsa-plugins
  lib32-cairo
  lib32-fontconfig
  lib32-gcc-libs
  lib32-glibc
  lib32-lcms2
  lib32-libgl
  lib32-libgpg-error
  lib32-libgudev
  lib32-libnm
  lib32-libogg
  lib32-libpulse
  lib32-libsndfile
  lib32-libusb
  lib32-libva
  lib32-libvdpau
  lib32-libvorbis
  lib32-libx11
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libxinerama
  lib32-libxss
  lib32-mpg123
  lib32-nss
  lib32-opus
  lib32-pango
  lib32-pipewire
  lib32-systemd
  lib32-vulkan-driver
  lib32-vulkan-icd-loader
)
optdepends=(
  steam
  lutris
  heroic-games-launcher
  umu-launcher
  faugus-launcher
  dmemcg-booster
  gamescope
  plasma-foreground-booster
  hyprland-focused-booster
  niri-focused-booster
)
optdepends+=(
  NTSYNC-MODULE
)
install=${pkgname}.install

prepare() {
    sed -i -E 's/"dwproton-[^"]*"/"dwproton"/g' \
      "${srcdir}/${_srcdir}/compatibilitytool.vdf"
}

package() {
    # License
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${srcdir}/${_srcdir}"/{PATENTS.AV1,LICENSE{,.OFL}} \
       "${pkgdir}/usr/share/licenses/${pkgname}"

    # Proton executable
    install -d "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
    mv "${srcdir}/${_srcdir}"/* \
       "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
}

