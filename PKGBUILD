# Maintainer: Shira Nguyen <sn3446409@gmail.com>

_pkgname=dwproton
pkgname=${_pkgname}-bin
_srcver=11.0-1
pkgver=${_srcver//-/_}
pkgrel=1
epoch=1
pkgdesc="Proton builds with the latest Dawn Winery fixes for gacha games, based on Proton-CachyOS."
arch=('x86_64')
url="https://dawn.wine/dawn-winery/dwproton"
license=('BSD' 'LGPL' 'zlib' 'MIT' 'MPL' 'custom')
options=(!strip emptydirs)
provides=('proton' 'dwproton')
_srcdir="${_pkgname}-${_srcver}-${CARCH}"
source=("${url}/releases/download/${_pkgname}-${_srcver}/${_srcdir}.tar.xz")
sha512sums=('bbbd669c413a93f6c7d06ac4eea794a82d7d95110621308a39f4b43da9cc6998ee54573351b99703a735d3e8286b07a63b94f18b9e4e23462a9be27fff4cb093')
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

