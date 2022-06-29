# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-factorio
pkgver=1.1.61
_pkgtag=$pkgver
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=('x86_64')
url="https://www.gog.com/game/factorio"
license=('custom')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental' 'factorio-headless' 'factorio-headless-experimental')
provides=("factorio=$pkgver")
makedepends=('lgogdownloader')
depends=('libxinerama' 'libxrandr' 'libxcursor' 'alsa-lib' 'libpulse' 'libglvnd')
source=("factorio_${pkgver//./_}_40478.sh::gogdownloader://1238653230/en3installer0"
        "Factorio.desktop")
sha512sums=('2899a9083ec6d409be8c4c1bce588d097f0f9da4638538733155deae1cab269d73e0b9b835c6cd998851e2c70141192d872687fca435ade42299bb5988050d4d'
            '32df74d21fdd19b70b3b81beb5b5735e82602c002e55eb40b77a365472f68294bbefbdf44c2fb6e6bfa1ff454f87751094506009d754a20697789f610cadb71a')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  install -d "${pkgdir}/usr/share/factorio/"
  mv "${srcdir}/data/noarch/game/data" -T "${pkgdir}/usr/share/factorio"
  chmod -R 644 "${pkgdir}/usr/share/factorio/"
  find "${pkgdir}/usr/share/factorio/" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/data/noarch/game/bin/x64/factorio" "${pkgdir}/usr/bin/factorio"
  install -Dm 755 "${srcdir}/Factorio.desktop" "$pkgdir/usr/share/applications/Factorio.desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
