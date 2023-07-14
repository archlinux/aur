# Maintainer: Benjamin Schneider <bschnei at gmail dot com>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Sebastien Duthil <duthils at free dot fr>

pkgname=factorio-demo
pkgver=1.1.87
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
makedepends=('xz')
source=(factorio.desktop
        LICENSE
        factorio_demo_x64_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux64
)
sha256sums=('61f62d75491147fbc6853cd7fa3a6f287227c3f5fc70dd9f4ec4083ebc31b743'
            '5f218befa5763542eeb3c6d68e0cb2540642d08f5e52f5376ef1d652362b2486'
            '5827df41fa4e71e60ce6d8ba97784582f1c4c9eb1ed5b8e7dd287c711f27b8d8')

# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "${srcdir}/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio-demo"

  install -m755 "bin/x64/factorio" "${pkgdir}/usr/bin/factorio"
  cp -r data/* "${pkgdir}/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio-demo/LICENSE"
}
