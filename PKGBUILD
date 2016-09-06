# Maintainer: Rock Neurotiko <miguelglafuente@gmail.com>
# Contributor: Sergio Conde <skgsergio@gmail.com>

pkgname=discord
pkgver=0.0.8
pkgrel=1
pkgdesc='Discord linux App'
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
conflicts=('discord')
license=('MIT')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.' 'libpulse: For pulseaudio support')


source=('Discord.desktop')
source_x86_64=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/discord-canary-${pkgver}.tar.gz")
sha256sums=('0826f0a07a567d3d966563151329e3e155bf47da528f0698bd677cb46cc468de')
sha256sums_x86_64=('7362afababed47a6c6ec114a755fdeccce247fe5de37a2e55bdb5dae639788bc')


package() {
  case $CARCH in
    'x86_64') _arch='x64';;
  esac

  # Install files
  install -d "${pkgdir}/opt/discord"
  cp -a "${srcdir}/DiscordCanary/." "${pkgdir}/opt/discord/"

  mv "${pkgdir}/opt/discord/DiscordCanary" "${pkgdir}/opt/discord/discord"

  # Make binary executable
  chmod 755 "${pkgdir}/opt/discord/discord"

  # Install desktop entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/Discord.desktop" "${pkgdir}/usr/share/applications"

  # Create symbolic link to the main binary
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/discord/discord" "${pkgdir}/usr/bin/discord"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/discord.png"

  # Install license file
  # install -Dm644 "${pkgdir}/opt/discord/LICENSE" "${pkgdir}/usr/share/licenses/discord/LICENSE"
  # rm "${pkgdir}/opt/discord/LICENSE"

  # Dirty hack... we should tell the developer to store settings in user home...
  # chmod 666 "${pkgdir}/opt/discord/resources/app/init.json"
}
