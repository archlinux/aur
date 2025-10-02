# Maintainer: Benjamin Schneider <ben at bens dot haus>
# Contributor: mickael9 <mickael9 at gmail dot com>
# Contributor: Sebastien Duthil <duthils at free dot fr>

pkgname=factorio-demo
pkgver=2.0.69
pkgrel=1
pkgdesc="A game in which you build and maintain factories"
arch=(x86_64)
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
makedepends=('xz')
source=(factorio-demo_linux_${pkgver}.tar.xz::http://www.factorio.com/get-download/${pkgver}/demo/linux64
        factorio.desktop
        LICENSE
)
sha256sums=('a670a4cd2fa59cb8dc6db10d969867266080f171e47ebed78880ccd5ed42356c'
            '61f62d75491147fbc6853cd7fa3a6f287227c3f5fc70dd9f4ec4083ebc31b743'
            'bc7f224b0fcc4cec82f5ca950b1c042251e27b0bcd0bf98f7945e09413a3c561')
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

check() {
  cd "${srcdir}/factorio"
  ./bin/x64/factorio --version
}
