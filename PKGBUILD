# Maintainer: SrKaysama <srkaysama@waifu.club>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>


_branch='discord-always-canary'

pkgname=discord-always-canary
pkgver=99.0.0
pkgrel=0
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
conflicts=('discord-canary')
license=('custom')
depends=('gtk2' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++')
optdepends=(
  'libpulse: For pulseaudio support'
  'noto-fonts-emoji: Google font for emoji support.'
  'ttf-symbola: Font for emoji support.'
)

install="DiscordCanary.install"
source=(DiscordCanary.desktop LICENSE)
source_x86_64=("https://discordapp.com/api/download/canary?platform=linux&format=tar.gz")
md5sums=('SKIP'
         'SKIP')
md5sums_x86_64=('SKIP')


#This is always latest build

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
