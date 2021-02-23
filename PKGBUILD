# Maintainer: Lukas1818 aur at lukas1818 dot de

pkgname=gog-shortest-trip-to-earth
pkgver=1.3.4
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
sha512sums=('d404c1f4a0e126611b2b5a0c301ce7105a309e9833d80c6d9a197a7c4800b96edfa617f636b22a4ff03ba1aaf92aad71b3bc314b31e0d723b3ddc7412387a344'
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
