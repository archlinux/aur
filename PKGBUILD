# Maintainer: Benjamin Schneider <bschnei at gmail dot com>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Sebastien Duthil <duthils at free dot fr>

pkgname=factorio-demo
pkgver=1.1.110
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
makedepends=('xz')
source=(factorio_demo_x64_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux64
        factorio.desktop
        LICENSE
)
sha256sums=('bddb91dcba9f300c25d590f861772eaf41f0b6ce8ae6b754de00d0e5f3eb5a35'
            '61f62d75491147fbc6853cd7fa3a6f287227c3f5fc70dd9f4ec4083ebc31b743'
            'bc7f224b0fcc4cec82f5ca950b1c042251e27b0bcd0bf98f7945e09413a3c561'
)
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
