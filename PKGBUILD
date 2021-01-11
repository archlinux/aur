# Maintainer Chris Werner Rau <aur@cwrau.io>

pkgname=heroic-games-launcher-electron
_pkgver=v1.0.0
pkgver=${_pkgver#v}
pkgrel=2
pkgdesc="HGL, a Native alternative Linux Launcher for Epic Games"
arch=('x86_64')
url="https://github.com/flavioislima/HeroicGamesLauncher"
license=('GPL3')
conflicts=(${pkgname%-*}-{appimage,bin})
depends=(electron)
_filename=heroic-${pkgver}.pacman
source=("$url/releases/download/${_pkgver}/${_filename}"
  heroic)
md5sums=('60a75a26a369ff2b9b0465a05ccad7b3'
         'b561c32112d481345acb0d9ca828fa01')
options=(!strip)

prepare() {
  sed -ri 's|^Exec=.+/heroic(.+)|Exec=/usr/bin/heroic -s\1|' "$srcdir/usr/share/applications/heroic.desktop"
  sed -ri 's|^Icon=.+heroic\.png|Icon=heroic|' "$srcdir/usr/share/applications/heroic.desktop"
}

package() {
  install -Dm755 "${srcdir}/heroic" -t "$pkgdir/usr/bin"
  install -Dm644 "${srcdir}/opt/heroic/resources/app.asar" -t "$pkgdir/opt/heroic"
  cp -r "${srcdir}/opt/heroic/resources/app.asar.unpacked" "$pkgdir/opt/heroic"
  install -Dm644 "${srcdir}/usr/share/applications/heroic.desktop" -t "$pkgdir/usr/share/applications"
  install -dm755 "${pkgdir}/usr/share/"
  cp -r --no-preserve=mode,ownership "${srcdir}/usr/share/icons" "${pkgdir}/usr/share/"
}

# vim:set ts=2 sw=2 et: syntax=sh
