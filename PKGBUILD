# Maintainer: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

pkgname=discord-ptb
pkgver=0.0.1
pkgrel=2
pkgdesc='Discord PTB linux release'
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord-ptb')
license=('custom')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss')
optdepends=('freetype2-infinality: If you have black screens with emojis install this.' 'libpulse: For pulseaudio support' )

install="DiscordPTB.install"
source=(DiscordPTB.desktop LICENSE DiscordPTB.sh)
source_x86_64=("https://dl-ptb.discordapp.net/apps/linux/${pkgver}/discord-ptb-${pkgver}.tar.gz")



#This is always latest build, right now I do not know of a version param.

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/DiscordPTB/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/DiscordPTB"


  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${srcdir}/DiscordPTB.desktop" "${pkgdir}/usr/share/applications"

  # Main binary
  install -d "${pkgdir}/usr/bin"
  #ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/DiscordCanary"
  #installing from .sh due to how the tar extracts.
  install "${srcdir}/DiscordPTB.sh" "${pkgdir}/usr/bin/discord-ptb"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
md5sums=('2ff4b71f582b9d62eadbb487d4190d15'
         '86acf3328debd24b95cdd037a276e059'
         'f49fa4791d8feafeef470040fb16746d')
md5sums_x86_64=('97c0b016d1aace174493cb18e949abd7')
