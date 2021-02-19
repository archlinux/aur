# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-factorio
pkgver=1.1.25
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
sha512sums=('69991683b94c9890a87e00374e16f3d56a2657e08ee2608c50d01f7f3442f9eadd297528257598293fa71584fbeca870f6d0ae51ca839cf0312db1d979cc3d85'
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
