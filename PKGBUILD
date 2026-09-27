# Maintainer: Andrey Kashlak <me@andreymal.org>
# Contributor: icefox <hd@revive-it.ru>

pkgname=aspia-client-bin
_pkgname=${pkgname%-bin}
pkgver=2.7.0
pkgrel=1
pkgdesc="Remote desktop control and file transfer tool (client, official binary)"
url="https://aspia.org/"
arch=(x86_64)
license=(GPL-3.0-only)
depends=(
  dbus
  glibc
  hicolor-icon-theme
  libgcc
  libgl
  libstdc++
  libx11
  libxcb
  libxfixes
  libxkbcommon
  libxkbcommon-x11
  ttf-font
  xcb-util-image
  xcb-util-keysyms
  xcb-util-renderutil
  xcb-util-wm
)
provides=(aspia-client)
conflicts=(aspia-client)
options=(!debug !strip)
source_x86_64=("https://github.com/dchapyshev/aspia/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${arch}.deb")
sha256sums_x86_64=('660ec5d89f6af90696ce734389e98d9642793f5f08dd5673ae42e6db7614f6dc')

package() {
  cd "${srcdir}"
  bsdtar -xzf data.tar.gz -C "${pkgdir}"

  # Fix "directory permissions differ"
  chmod 755 "$pkgdir/usr"
  chmod 755 "$pkgdir/usr/bin"
  chmod 755 "$pkgdir/usr/share"
  chmod 755 "$pkgdir/usr/share/applications"
  chmod 755 "$pkgdir/usr/share/icons"
  chmod 755 "$pkgdir/usr/share/icons/hicolor"
  chmod 755 "$pkgdir/usr/share/icons/hicolor"/*
  chmod 755 "$pkgdir/usr/share/icons/hicolor"/*/apps
}
