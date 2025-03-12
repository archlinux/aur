# Maintainer: Kimiblock Moe
# Contributor: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Morgan <morganamilo@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org>
# Contributor: Robin Candau <antiz@archlinux.org>

pkgname=discord-bwrap
_pkgname=Discord
pkgver=0.0.88
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
sha512sums=('e15beb272ed7856167bc963810799dc2637cd765a551f576498e6c380d1840635303c0d19b1130fc1e7269053cd66b5e5d88182364b97bbdbd83b67507cf980f'
            '12bde66a22dec185c68166bd6ae69cfbab49f47c8ff18858f036941c611dd56df7bfd7e616fc57d773cffe7bc4a5cd2e912213eeb643e5f2d2fedc3db69487ad'
            'f07eadb04dd63721b0f63354f856bdea2022962b22406b16599e601939fc37118034d9f77240816c466443f761e0f4eae7861f9dd1750f87ea1befd6c81e2e44'
            '9c06d75a25f1f4a7027d8d4191603cdccb7c1b626995b697106410204840e4dd23f157e7b313a763579d666ff839004d676032e289ca594e25d94be611c9ad66'
            'cdebaec8f1ad5ce7992e6c82700693e7354272593162d0cd5483e964537ddcf0e9996a6e728d2dc6409b1a6135b7ee2a2e5ab9028036c9146b01cc95a6c35c0d'
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
