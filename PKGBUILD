# Maintainer: Erik Katzenberger <mail@wirecat.cc>
pkgname=apple_hyprcursor
pkgver=0.1
pkgrel=2
pkgdesc="Hyprcursor version of https://github.com/ful1e5/apple_cursor"
arch=(any)
url="https://github.com/6ooker/apple_hyprcursor"
license=('GPL-3.0-only')
source=(
  "macOS-hypr_${pkgver}.tar.xz::${url}/releases/download/${pkgver}/macOS-hypr.tar.xz"
)
sha256sums=(
  '5e8809b54c7341bab31ba122114a04774d6beb9673a991e6e12965ab580676e2'
)

prepare() {
  bsdtar -xf "${srcdir}/macOS-hypr_${pkgver}.tar.xz"
}

package() {
  install -dm755 "${pkgdir}/usr/share/icons/"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr/share/icons/" "${srcdir}/macOS-hypr"
  cp -a --no-preserve=ownership -t "${pkgdir}/usr/share/icons/" "${srcdir}/macOS-hypr_white"
}

post_install() {
  cat << EOF
${pkgname}: In order to use the theme, in your hyprland.conf file add
            env = HYPRCURSOR_THEME,macOS-hypr
            env = HYPRCURSOR_SIZE,<int-size>
            - OR -
            Set via CLI
            hyprctl setcursor macOS-hypr, <int-size>
EOF
}
