# Maintainer: Cayde Dixon <me@cazzar.net>

pkgname=discord-canary
pkgver=0.0.0
pkgrel=2
pkgdesc='Discord Canary linux release'
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord-canary')
license=('custom')
depends=('gtk2' 'gconf')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.')

source=(DiscordCanary.desktop LICENSE)
source_x86_64=("https://storage.googleapis.com/discord-developer/test/discord-canary-${pkgver}.tar.gz")
sha256sums=('851cf241f5f2418a4a5dc533e0060844ee5673f7cac563fd33e2584b09dbe2d0' '688f418cd32a682c6d331c211fedd48ff86ee8ba5a7640f589eadb32996af80f')
sha256sums_x86_64=('0edc1be19faf2e6401c408b1097901ce582222348f144e38c51749bd38ba3dd6')

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/DiscordCanary/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/DiscordCanary"


  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/DiscordCanary.desktop" "${pkgdir}/usr/share/applications"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/DiscordCanary"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
