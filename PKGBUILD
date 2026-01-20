# Maintainer: Hasan C
pkgname=gw2taco-bin
pkgver=067.3705r
pkgrel=1
pkgdesc="Guild Wars 2 Tactical Overlay (GW2TacO) - upstream Windows binary (runs via Wine)"
arch=('any')
url="https://github.com/BoyC/GW2TacO"
license=('LicenseRef-GW2TacO')
depends=('wine')
optdepends=('winetricks: install Windows runtimes into the Wine prefix if needed')
provides=('gw2taco')
conflicts=('gw2taco')

_major="${pkgver%%.*}"

source=(
  "${pkgname}-${pkgver}.zip::https://github.com/BoyC/GW2TacO/releases/download/${pkgver}/GW2TacO_${_major}r.zip"
  "gw2taco"
  "gw2taco.desktop"
)

sha256sums=('8930e4e62a2d5eb91c66c091b1019bc25931707236edefb9af8f5730131b35e3'
            'c6f286c998a872022bfe7ebde2e054e74d5b2211226c996eeeaee08086e398ec'
            '517d3dd9b94e9e1613e8a92544abf320691c19c675a2845c32009049ebed6f7b')

package() {
  install -d "${pkgdir}/opt/gw2taco"
  bsdtar -xf "${srcdir}/${pkgname}-${pkgver}.zip" -C "${pkgdir}/opt/gw2taco"

  install -Dm755 "${srcdir}/gw2taco" "${pkgdir}/usr/bin/gw2taco"
  install -Dm644 "${srcdir}/gw2taco.desktop" "${pkgdir}/usr/share/applications/gw2taco.desktop"

  if [[ -f "${pkgdir}/opt/gw2taco/LICENSE" ]]; then
    install -Dm644 "${pkgdir}/opt/gw2taco/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
