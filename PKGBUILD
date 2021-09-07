# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=cope

pkgname=cope-bin
pkgver=0.3
pkgrel=1
pkgdesc="Chinese Old Poem Editor - A modern IDE for writing classical Chinese poetry"
arch=('x86_64')
url="https://github.com/LingDong-/cope"
license=('ISC')
options=('!strip')
depends=('gtk3' 'libxss' 'nss')
makedepends=('libicns')
provides=('cope')
conflicts=('cope')
source=(
  "${_srcname}-${pkgver}-linux-x64.zip::${url}/releases/download/v${pkgver}/${_srcname}-linux-x64.zip"
  cope.desktop
)
sha256sums=(
  '7999d059fe8683cadad0d7b16a6b2845d757ffd32a5df137929c61fb443812f0'
  '90f16a7e1c2b4c335a5dfb3bddbbbbe0e661ccb7824b1c978c9abf6a5c333fcd'
)

package() {
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/pixmaps"

  cp -r "${_srcname}-linux-x64" "${pkgdir}/opt/${_srcname}"
  ln -s "/opt/${_srcname}/cope" "${pkgdir}/usr/bin/cope"
  icns2png -x "${pkgdir}/opt/${_srcname}/resources/app/icon.icns"
  install -Dm644 icon_512x512x32.png "${pkgdir}/usr/share/pixmaps/${_srcname}.png"
  install -Dm644 cope.desktop "${pkgdir}/usr/share/applications/cope.desktop"
}
