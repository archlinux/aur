# Maintainer: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=mozregression-gui-bin
_pkgname=mozregression-gui
pkgver=4.0.14
pkgrel=1
pkgdesc='Regression range finder for Firefox'
arch=('any')
license=(MPL)
url="https://github.com/mozilla/mozregression"
options=('!strip')
depends=("gtk3" "ncurses5-compat-libs" "qt5-wayland" "qt5-multimedia" "libbsd" "libyaml" "qt5-webengine" "qt5-quickcontrols2" "qt5-sensors" "qt5-virtualkeyboard" "python")
provides=("${_pkgname}=${pkgver}")
source=("https://github.com/mozilla/mozregression/releases/download/$pkgver/${_pkgname}.tar.gz"
        "${_pkgname}.desktop"
        "https://raw.githubusercontent.com/mozilla/mozregression/master/gui/icons/app_icon.png")
sha256sums=('4c874267ae6453d18f73cd4cec44fad4b3417b4532c6291d6397f6502b00ef9e'
            '0b51e2692ef75addd98365185ff05524426ca1735f43d6b1cafa0e71d71481cb'
            'eec9a7ab76d757b7f03ceea4a65623337a6625989f4aa801d07f71aa37175e23')

package() {
  install -d "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt/${_pkgname}}

  cp -r ./${_pkgname}/* "${pkgdir}"/opt/${_pkgname}/
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/${_pkgname}" <<END
#!/bin/sh
exec /opt/${_pkgname}/${_pkgname} "\$@"
END
  install -m644 "${srcdir}"/${_pkgname}.desktop "${pkgdir}"/usr/share/applications/
  install -m644 "${srcdir}"/app_icon.png "${pkgdir}"/usr/share/pixmaps/${_pkgname}.png
}
# vim:set ts=2 sw=2 et:
