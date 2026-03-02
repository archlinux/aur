# Maintainer: Malte Jürgens <maltejur@dismail.de>
# Contributor: hawkeye116477 <hawkeye116477 at gmail dot com>

pkgname=mozregression-gui-bin
_pkgname=mozregression-gui
pkgver=7.2.0
pkgrel=1
pkgdesc='Regression range finder for Firefox'
arch=('any')
license=(MPL)
url="https://github.com/mozilla/mozregression"
options=('!strip')
depends=("libbsd" "libyaml" "python")
provides=("${_pkgname}=${pkgver}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/mozilla/mozregression/releases/download/${pkgver}/${_pkgname}-ubuntu-24.04.tar.gz"
        "${_pkgname}.desktop"
        "https://raw.githubusercontent.com/mozilla/mozregression/master/gui/icons/app_icon.png")
sha256sums=('725928b000b851a5e2abaf25895402a7992157f0b992fd7afbcf9b06b1b83b38'
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
