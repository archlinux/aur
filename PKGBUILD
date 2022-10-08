# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Original PKGBUILD by Mario Finelli <mario at finel dot li>

pkgname=super-mario-4-jugadores
pkgver=2.0.5
pkgrel=2
pkgdesc="A fangame of Super Mario Bros."
arch=('i686' 'x86_64')
url="https://carlosxdjavgames.altervista.org/archivos/134/"
license=('custom')
depends=('desktop-file-utils')
makedepends=('p7zip' 'wget')
source=("https://cdn.discordapp.com/attachments/630931682924429328/808555699637846026/SM4J2.0.5Fix.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "License.txt"
        "runner::https://github.com/YidaozhanYa/yoyogames-runner-bin/raw/main/runner")
install="${pkgname}.install"
sha256sums=('9ae90076ccd567254d1c4d12c009aa51d511df24e7efc03d4404bb5f8ac15795'
            '8352f56fa923bc8e283ff091ffac508169d4563d92bab4ede2285bddbfe09cd9'
            '973a5fdf29f81a18fa97f1a926d639e8615057666b906f05238b12a74e740e15'
            'e2333a34a96432b05241bf72e71f7b16207fa50e3165250cfc1008e360738b68'
            'cca9b7a85a55c1b8cfa1e7ea5e7ed2b7468627464424f178e15b05df919045f0')

package() {
  7z x "SM4J2.0.5Fix.zip" -o"${pkgdir}/usr/share/${pkgname}/assets"

  # correct filesystem permissions
  find "${pkgdir}" -type d -execdir chmod 755 {} +

  install -Dm0644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/share/${pkgname}/assets/data.win" "${pkgdir}/usr/share/${pkgname}/game.unx"
  install -Dm0755 runner "${pkgdir}/usr/share/${pkgname}/SM4JLegacy"
  mkdir "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/usr/share/${pkgname}/SM4JLegacy" "${pkgdir}/usr/bin/super-mario-4-jugadores"
  install -Dm0644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

