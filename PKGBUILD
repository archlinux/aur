# Maintainer: Benjamin Schneider <bschnei at gmail dot com>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Sebastien Duthil <duthils at free dot fr>

pkgname=factorio-demo
pkgver=1.1.104
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
            'bc7f224b0fcc4cec82f5ca950b1c042251e27b0bcd0bf98f7945e09413a3c561'
            '5458e5025d75aedab73af7c3c7c805ee1e17561a8232c112c3d73d758d6f0874')

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
