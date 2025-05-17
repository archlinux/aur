# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.94
pkgrel=1
pkgdesc="All-in-one voice and text chat for gamers. Sandboxed for privacy."
arch=('x86_64')
url='https://discord.com'
license=('custom')
conflicts=("discord")
provides+=("discord" "discord-sandbox" "discord-portable")
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
sha512sums=('de51af7e74a0e50f826719b37bd11dfdc82792266d8284fba050019a5993474149631a1a5a8fa4e061741e613ae2fd78ab6b50f4768d993281ee132fa60c0ec5'
            'c2539cbdda30ca4ada4beba9d1719554c62ad18ef574177aaab988dea50d63c6448650b5ed01d1d27987ef747c26dbddf79a385db11a2ea5c3b9a01776823647'
            '46579feeee58f024def5beb1a464e270c2b7b97690aaf84dc5fd12a5744fb05c794bb773a9d318cb82fbe92f2ddfa4dd4014e2acab7a3a250434d8d55dedd1ef'
            '9c06d75a25f1f4a7027d8d4191603cdccb7c1b626995b697106410204840e4dd23f157e7b313a763579d666ff839004d676032e289ca594e25d94be611c9ad66'
            '491f74c7235be0697f12ff97084fbaaec9185d397eb10d7803e7ca47b5b75d782113aa6855359d7517ff1d130d1f71ba7107cc64ecec34b3576dee1ea9faf3b4'
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
