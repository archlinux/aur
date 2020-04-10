# Maintainer: mickael9 <mickael9@gmail.com>
# Contributor: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-demo
pkgver=0.17.79
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories."
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
sha256sums=('c3bbe51c3c35641d6064ff0f8470294f8a317f0413bb149f6bd47461b03804bf'
            '67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21'
            'f1518c8f06da2de812100aac4c7585d69fd86a3f953e17fc4ef46facb4b2131f')

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
