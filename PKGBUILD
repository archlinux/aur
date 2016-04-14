# Maintainer: Cayde Dixon <me@cazzar.net>

pkgname=discord-canary
pkgver=0.0.1
pkgrel=5
pkgdesc='Discord Canary linux release'
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord-canary')
license=('custom')
depends=('gtk2' 'gconf' 'libnotify')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.')

source=(DiscordCanary.desktop LICENSE DiscordCanary.sh)
source_x86_64=("https://storage.googleapis.com/discord-developer/test/discord-canary-${pkgver}.tar.gz")
sha256sums=('13d122f47be0d659b0630be52d82bbfc838861ce213c1f024ea71445dd2067fe' '688f418cd32a682c6d331c211fedd48ff86ee8ba5a7640f589eadb32996af80f' '912cb31b21023980614437b859bb11f39697108c0e9ca21778f81da8065a0815')
sha256sums_x86_64=('0fb4b64b6119311279ec79b4a11c9f0640553ca437e36302f3b8134d10e375ea')

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
  #ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/DiscordCanary"
  #installing from .sh due to how the tar extracts.
  install "${srcdir}/DiscordCanary.sh" "${pkgdir}/usr/bin/DiscordCanary"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
