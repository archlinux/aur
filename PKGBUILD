# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.87
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers. Sandboxed for privacy."
arch=('x86_64')
url='https://discord.com'
license=('custom')
conflicts=("discord")
options=(!debug !strip)
optdepends=('libpulse: PulseAudio support'
            'libappindicator-gtk3: Systray indicator support'
            'xdg-utils: Open files')
source=("https://dl.discordapp.net/apps/linux/$pkgver/discord-$pkgver.tar.gz"
        "LICENSE-$pkgver.html::https://discordapp.com/terms"
        "OSS-LICENSES-$pkgver.html::https://discordapp.com/licenses"
        "portable-config"
        "discord.sh"
        "discord.desktop")
sha512sums=('7ad746d33daf4ef654f31ff485a93e81dfb9e6b850f09aac88e63fd30ceb7e6c3c2871118ba310a8032f5915a5a26b944059c6e348d219f2b1f4eb88ea1ef4f7'
            'd66eec4ea6a46801271709293b78c07ad4b1394789faca4166b99d9775b0aa235526a9e56ffbe8617841d54fe4bd3d1a38a76593a26b65525a5cb956cd48d3fc'
            '09ceb25dd50477d2ef8da160f0ba3dc223ca84a97b837d00e38dd548e8265b2805076fd9495f2cf7cbae699b16a0bda30d1ebf99fe26aadba6df6fe1db693e00'
            'f07109cdfd29924db5c39a5b3c57fb37ea83f7b5868495c4117587bc666a5e58b78414c2ef6903340541f68eeaad5be6fe34c8b86160103cde6b93ec6724f351'
            'e28775a011b1e5002e76aaf72d32b86052e76044d57956a854d4697f3a8a3dbb94ddf6509bc0c5d215b596c4b883911a059e03219ff6cdbc9eb25fab7cdb79e5'
            '534f181b2f7927a1a5e77528e8e7fc138b117c5f690d3b581e57428b55bca42329bb0fa704fbe4ffea9adc64d46f6dce05ef5eb581d33d043acf55519d6407a9')

package() {
  depends=('libnotify' 'libxss' 'nspr' 'nss' 'gtk3' "portable")
  install -d "$pkgdir"/opt/discord
  install -Dm644 \
  	"discord.desktop" \
  	"${pkgdir}/usr/share/applications/com.discordapp.Discord.desktop"
  cp -a $_pkgname/. "$pkgdir"/opt/discord

  chmod 755 "$pkgdir"/opt/discord/$_pkgname

  rm "$pkgdir"/opt/discord/postinst.sh

  install -d "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/applications

  install -d "$pkgdir"/usr/share/icons/hicolor/256x256/apps
  ln -s /opt/discord/discord.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/discord.png

  install -Dm644 LICENSE-$pkgver.html "$pkgdir"/usr/share/licenses/discord/LICENSE.html
  install -Dm644 OSS-LICENSES-$pkgver.html "$pkgdir"/usr/share/licenses/discord/OSS-LICENSES.html
  install -Dm644 portable-config "${pkgdir}/usr/lib/portable/info/com.discord.app/config"
  install -Dm755 discord.sh "${pkgdir}/usr/bin/Discord"
}
