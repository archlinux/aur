# Maintainer: YidaozhanYa <yidaozhan_ya@outlook.com>
# Original PKGBUILD by Mario Finelli <mario at finel dot li>

pkgname=super-mario-4-jugadores
pkgver=2.0.5_3
pkgrel=1
pkgdesc="A fangame of Super Mario Bros."
arch=('i686' 'x86_64')
url="https://carlosxdjavgames.altervista.org/archivos/134/"
license=('custom')
depends=('desktop-file-utils')
makedepends=('p7zip' 'wget')
source=("SM4J.zip::https://archive.org/download/infoserver/SM4JLegacy%202.0.5Fixv3_1.zip"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "License.txt"
        "runner::https://github.com/YidaozhanYa/yoyogames-runner-bin/raw/main/runner")
install="${pkgname}.install"
sha256sums=('103223132040355a7724cf69d80e01762c600253a7c7d343dd26a4efa4481427'
            '8352f56fa923bc8e283ff091ffac508169d4563d92bab4ede2285bddbfe09cd9'
            '973a5fdf29f81a18fa97f1a926d639e8615057666b906f05238b12a74e740e15'
            'e2333a34a96432b05241bf72e71f7b16207fa50e3165250cfc1008e360738b68'
            'cca9b7a85a55c1b8cfa1e7ea5e7ed2b7468627464424f178e15b05df919045f0')

package() {
  7z x "SM4J.zip" -o"${pkgdir}/usr/share/${pkgname}/assets"

  # correct filesystem permissions
  find "${pkgdir}" -type d -execdir chmod 755 {} +

  install -Dm0644 "License.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  mv "${pkgdir}/usr/share/${pkgname}/assets/data.win" "${pkgdir}/usr/share/${pkgname}/assets/game.unx"
  rm "${pkgdir}/usr/share/${pkgname}/assets/SM4JLegacy.exe"
  install -Dm0755 runner "${pkgdir}/usr/share/${pkgname}/SM4JLegacy"
  mkdir "${pkgdir}/usr/bin"
  ln -s "${pkgdir}/usr/share/${pkgname}/SM4JLegacy" "${pkgdir}/usr/bin/super-mario-4-jugadores"
  install -Dm0644 ${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm0644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

