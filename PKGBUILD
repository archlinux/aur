# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.84
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
sha512sums=('22b57029d183241479198ec802a1a2ce763d7386174beaa2541bb48af8a191630b42caa9133a7faf0e8424eba9e88ec7829f8f586b94ea63fa35bb3d1d338d29'
            '7bf36a95449c38f2111a8f612b883ba51652bf32822acd92233034bae51d3d35d9c38ebb63fecd332de0c73e04ecab0be66eb6b635c38f96adadbffb7b6471fa'
            '60a86c3cebf296aac04196dc958b7d59cc6a47168b81f19d36aaa6f1fc76049f8b3be71d6e076bfd346263f6fb7f2b55ae819ba98857017bc45ae68d7028514c'
            '9c06d75a25f1f4a7027d8d4191603cdccb7c1b626995b697106410204840e4dd23f157e7b313a763579d666ff839004d676032e289ca594e25d94be611c9ad66'
            '1d4b34acdb0b4a7ffc4149fcf99d69d321eac876c5b4ea673cfc1264f07363fec0e31815a821137859230ac053e97537d9a7c2a2b2d5b990bc131ff7859fc2e3'
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
