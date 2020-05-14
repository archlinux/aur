# Maintainer: Ivan Fonseca <ivanfon@riseup.net>

pkgname=godot-beta-bin
pkgver=3.2.2_beta2
pkgrel=1
pkgdesc='The latest official beta release of the Godot game engine'
url='https://godotengine.org'
license=('MIT')
arch=('i686' 'x86_64')
provides=('godot-beta-bin')
source=('godot-beta.desktop')
source_i686+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta2/Godot_v3.2.2-beta2_x11.32.zip')
source_x86_64+=('https://downloads.tuxfamily.org/godotengine/3.2.2/beta2/Godot_v3.2.2-beta2_x11.64.zip')
sha256sums=('53912a2e312559455045e8e83f6e239a2cbc6f891ebb393f441c772063bb9497')
sha256sums_i686=('994e8883a177172b812a818fcd94d10186d3816a358fc1b261b6f474e11bb82e')
sha256sums_x86_64=('e93c2eac1438b32fc3c63de1205b80a84c257b6094381872f872aed3cbd56f0f')

package() {
  ver=${pkgver/_/-}

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/applications"

  case $CARCH in
    "i686")
      cp "${srcdir}/Godot_v${ver}_x11.32" "${pkgdir}/opt/${pkgname}/godot-beta"
    ;;
    "x86_64")
      cp "${srcdir}/Godot_v${ver}_x11.64" "${pkgdir}/opt/${pkgname}/godot-beta"
    ;;
  esac

  cp "${srcdir}/godot-beta.desktop" "${pkgdir}/usr/share/applications/godot-beta.desktop"

  chmod +x "${pkgdir}/opt/${pkgname}/godot-beta"

  ln -s "/opt/${pkgname}/godot-beta" "${pkgdir}/usr/bin/godot-beta"
}
