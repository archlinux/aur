# Maintainer: Anna <morganamilo@gmail.com>
# Co-Maintainer: E5ten <e5ten.arch@gmail.com>
# Contributor: Cayde Dixon <me@cazzar.net>
# Contributor: Anthony Anderson <aantony4122@gmail.com>

pkgname='discord-canary'
pkgver=0.0.71
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers that's free and secure."
arch=('x86_64')
url='https://discordapp.com/'
provides=('discord')
license=('custom')
depends=('gtk3' 'gconf' 'libnotify' 'libxss' 'glibc' 'alsa-lib' 'nspr' 'nss' 'libc++' 'xdg-utils' 'libcups')
optdepends=('libpulse: For pulseaudio support'
            'noto-fonts-emoji: Google font for emoji support.'
            'ttf-symbola: Font for emoji support.'
            'noto-fonts-cjk: Font for special characters such as /shrug face.')
source=("https://dl-canary.discordapp.net/apps/linux/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'LICENSE')
sha512sums=('498bc32e6ab182ef1ac38d2ff1cde59eaba026bfa01d058cfef812993e092c56f0c84aef015344a46baed1dc11445604ba0025c0f4475df6d60afdba3605cdca'
            '5febdc5fb94739953618e88523780d79225af06b52ebfbfaa85c1ef90861c4f19dd0180f4eb1c0ff20b12e12a79366cab2cd2cd438568caefb9879545c525933')

package() {
  # Install the main files.
  install -d "${pkgdir}/opt/${pkgname}"
  cp -a "${srcdir}/DiscordCanary/." "${pkgdir}/opt/${pkgname}"

  # Exec bit
  chmod 755 "${pkgdir}/opt/${pkgname}/DiscordCanary"

  # Desktop Entry
  install -d "${pkgdir}/usr/share/applications"
  install "${pkgdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications"
  sed -i s%/usr/share%/opt% ${pkgdir}/usr/share/applications/${pkgname}.desktop``
  # Main binary
  #install "${srcdir}/Discord.sh" "${pkgdir}/usr/bin/discord"
  mkdir -p $pkgdir/usr/bin
  ln -s "/opt/${pkgname}/DiscordCanary" "${pkgdir}/usr/bin/${pkgname}"

  # Create symbolic link to the icon
  install -d "${pkgdir}/usr/share/pixmaps"
  ln -s "/opt/${pkgname}/discord.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

