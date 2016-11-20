# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-demo
pkgver=0.14.20
pkgrel=1
pkgdesc="A 2D game about building and maintaining factories."
arch=('x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio' 'factorio-headless' 'factorio-experimental')
source=(factorio.desktop
        LICENSE)
source_x86_64=(factorio_demo_x64_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/demo/linux64)
sha256sums=('5f62aa7763f9ad367a051371bc16f3c174022bb3380eb221ba06bac395bf9815'
         '67ec2f88afff5d7e0ca5fd3301b5d98655269c161a394368fa0ec49fbc0c0e21')
sha256sums_x86_64=('1df5d1e40b08a209a52d778f0494143081ab3c51e9f0d33a6c11f2af679efc69')



# no modifications needed, the executable looks for:
# - data in /usr/share/factorio
# - config in ~/.factorio

package() {
  cd "$srcdir/factorio"

  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/factorio"
  install -d "${pkgdir}/usr/share/licenses/factorio-demo"

  install -m755 bin/*/factorio "${pkgdir}/usr/bin/factorio"
  cp -r data/* "${pkgdir}/usr/share/factorio"
  install -m644 "${srcdir}/factorio.desktop" "${pkgdir}/usr/share/applications/factorio.desktop"
  install -m644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/factorio-demo/LICENSE"
}
