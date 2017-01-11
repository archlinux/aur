# Maintainer: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

pkgname=discord
pkgver=0.0.1
pkgrel=2
pkgdesc='Discord Stable linux release'
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
license=('custom')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.' 'libpulse: For pulseaudio support' )

install="Discord.install"
source=(Discord.desktop LICENSE Discord.sh)
source_x86_64=("https://dl.discordapp.net/apps/linux/${pkgver}/discord-${pkgver}.tar.gz")
md5sums=('fdc9784f37b28178b2e9c498e4eebed9'
         '86acf3328debd24b95cdd037a276e059'
         '0dd3e753e0a96ad20de6b307bcd20b23')
md5sums_x86_64=('8356283b4e72d36955fa2589d4dd321a')



#This is always latest build, right now I do not know of a version param.

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/Discord/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/Discord"


  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/Discord.desktop" "${pkgdir}/usr/share/applications"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  #ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/DiscordCanary"
  #installing from .sh due to how the tar extracts.
  install "${srcdir}/Discord.sh" "${pkgdir}/usr/bin/discord"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
