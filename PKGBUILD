# Maintainer: Sebastien Duthil <duthils@free.fr>

pkgname=factorio-demo
pkgver=0.11.22
pkgrel=3
pkgdesc="A 2D game about building and maintaining factories."
arch=('i686' 'x86_64')
url="http://www.factorio.com/"
license=('custom: commercial')
depends=('libxcursor' 'alsa-lib' 'libxrandr' 'libxinerama' 'mesa')
conflicts=('factorio')
source=(factorio.desktop
        LICENSE)
md5sums=('5cacd198a3156c157a482aeab368e9a1'
         '22fce67d66c080fa5c89ab437b3d8724')
source_i686=(factorio_demo_i386_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/demo/linux32)
md5sums_i686=('828b0fbff6855ef820f98b127b83d36e')
source_x86_64=(factorio_demo_x64_${pkgver}.tar.gz::http://www.factorio.com/get-download/${pkgver}/demo/linux64)
md5sums_x86_64=('0cdbd9d604d373c985f213cec4d5c38c')

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
