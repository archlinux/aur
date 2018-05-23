# Maintainer: Anna <morganamilo@gmail.com>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>


_branch='discord-canary'

pkgname=discord-canary
pkgver=0.0.51
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
license=('custom')
depends=('gtk3' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++' 'xdg-utils')
optdepends=(
  'libpulse: For pulseaudio support'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
)

install="DiscordCanary.install"
source=(DiscordCanary.desktop LICENSE)
source_x86_64=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${_branch}-${pkgver}.tar.gz")
md5sums=('2ff4b71f582b9d62eadbb487d4190d15'
         '26b3229c74488c64d94798e48bc49fcd')
md5sums_x86_64=('a5d7a1f9648532906cd0f24e3df091db')



#This is always latest build, right now I do not know of a version param.

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
  #install "${srcdir}/Discord.sh" "${pkgdir}/usr/bin/discord"
  ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/${pkgname}"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
