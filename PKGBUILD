# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-shortest-trip-to-earth
pkgver=1.3.7
_pkgtag=$pkgver
pkgrel=1
pkgdesc="a roguelike spaceship simulator featuring exploration, ship management, game-influencing decision-making and real-time tactical battles"
arch=('x86_64')
url="https://www.gog.com/game/$(echo ${pkgname//-/_} | cut -c 5-)"
license=('custom')
groups=('gog' 'games')
makedepends=('lgogdownloader')
depends=('gtk2' 'bash')
source=("$(echo ${pkgname//-/_} | cut -c 5-)_${pkgver//./_}.sh::gogdownloader://1911995101/en3installer0"
        "Shortest Trip to Earth.desktop"
        "start-${pkgname:4}.sh")
sha512sums=('1c2a70b915d15413a25da2818e63b796b1a8e12a2787493c571e31d51909b5bfa61675ccddf907b7344536e0c40fd7ef95cb2aeb2a0449b6f1f5f63bd4cd8cc4'
            'ec744a0f995ea5d746cf496d54e0a822b7d366c4c6cdff687163ceb0e876b11ee1b8307f19a74b0445414f096160c006537d8d46fc1d40c878bb716e281f93f1'
            'a0d8350d6bb2c1778e032052a85932227ee491a863ba7ed82fc09eaefad9bd380a2fdd573a16e049c6a2a277ad4ccb06b14c6287d8a2bc7d9841dd39225aa988')

DLAGENTS+=('gogdownloader::/usr/bin/lgogdownloader --download-file=%u -o %o')

package()
{
  mkdir -p "${pkgdir}/opt/$pkgname"
  mv "${srcdir}/data/noarch/game" -T "${pkgdir}/opt/$pkgname"
  chmod -R 644 "${pkgdir}/opt/$pkgname/"
	chmod    755 "${pkgdir}/opt/$pkgname/STEarth"
  find "${pkgdir}/opt/$pkgname" -type d -exec chmod 755 {} \;
  install -Dm 755 "${srcdir}/start-${pkgname:4}.sh" "${pkgdir}/usr/bin/${pkgname:4}"
  install -Dm 755 "${srcdir}/Shortest Trip to Earth.desktop" "$pkgdir/usr/share/applications/Shortest Trip to Earth.desktop"
  install -Dm 644 "${srcdir}/data/noarch/support/icon.png" "${pkgdir}/usr/share/pixmaps/$pkgname.png"
  install -Dm 644 "${srcdir}/data/noarch/docs/End User License Agreement.txt" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
