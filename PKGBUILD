# Maintainer: Shira Nguyen <sn3446409@gmail.com>

_pkgname=dwproton
pkgname=${_pkgname}-bin
_srcver=10.0-14
pkgver=${_srcver//-/_}
pkgrel=3
epoch=1
pkgdesc="Proton builds with the latest Dawn Winery fixes for gacha games, based on Proton-CachyOS"
arch=('x86_64')
url="https://dawn.wine/dawn-winery/dwproton"
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
options=(!strip emptydirs)
provides=('proton' 'dwproton')
source=("${url}/releases/download/${_pkgname}-${_srcver}/${_pkgname}-${_srcver}-x86_64.tar.xz")
sha256sums=('98aaf1860d0d04a1a7745996b18e7cb3d4a27673c0a4c81197f149913f7a93ac')
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
  libxcrypt
  libxcrypt-compat
  libxkbcommon-x11
  lsb-release
  lsof
  nss
  python
  ttf-font
  usbutils
  vulkan-driver
  vulkan-icd-loader
  xdg-user-dirs
  xorg-xrandr
  xz
  zenity
)
depends_x86_64=(
  lib32-alsa-plugins
  lib32-fontconfig
  lib32-gcc-libs
  lib32-glibc
  lib32-libgl
  lib32-libgpg-error
  lib32-libnm
  lib32-libva
  lib32-libx11
  lib32-libxcrypt
  lib32-libxcrypt-compat
  lib32-libxinerama
  lib32-libxss
  lib32-nss
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
)
install=${pkgname}.install

build() {
    # Similar to how proton-ge-custom-bin worked
    sed -i -E 's/"dwproton-[^"]*"/"dwproton"/g' "${srcdir}/${_pkgname}-${_srcver}-x86_64"/compatibilitytool.vdf
}

package() {
    # License
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${srcdir}/${_pkgname}-${_srcver}-x86_64"/{PATENTS.AV1,LICENSE{,.OFL}} "${pkgdir}/usr/share/licenses/${pkgname}"

    # Proton executable
    install -d "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
    mv "${srcdir}/${_pkgname}-${_srcver}-x86_64"/* "${pkgdir}/usr/share/steam/compatibilitytools.d/${_pkgname}"
}
