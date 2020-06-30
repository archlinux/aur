# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-factorio
pkgver=0.17.79
_pkgtag=$pkgver
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=('x86_64')
url="https://www.gog.com/game/factorio"
license=('custom')
conflicts=('factorio' 'factorio-demo' 'factorio-experimental' 'factorio-headless' 'factorio-headless-experimental')
depends=('glibc' 'libx11' 'libxinerama' 'libxrandr' 'libxcursor' 'alsa-lib' 'libpulse')
source=("factorio_${pkgver//./_}_34050.sh::gogdownloader://factorio/en3installer0"
        "Factorio.desktop")
sha512sums=('1fb966d424c46b504533a9fce87832076746ede8a5fa1e25140a59c4ba221d8622243829b7bf6e5a3127676e9daaae50863547b2f6e03fbc0b62fa11e2acc400'
            '32df74d21fdd19b70b3b81beb5b5735e82602c002e55eb40b77a365472f68294bbefbdf44c2fb6e6bfa1ff454f87751094506009d754a20697789f610cadb71a')

package()
{
  install -d "${pkgdir}/usr/share/factorio/"
  cp -r "${srcdir}/data/noarch/game/data" -T "${pkgdir}/usr/share/factorio/"
  chmod -R 644 "${pkgdir}/usr/share/factorio/"
  find "${pkgdir}/usr/share/factorio/" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/data/noarch/game/bin/x64/factorio" "${pkgdir}/usr/bin/factorio"
  install -Dm 755 "${srcdir}/Factorio.desktop" "$pkgdir/usr/share/applications/Factorio.desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
