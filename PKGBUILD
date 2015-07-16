pkgname=babelmap
pkgver=8.0.0.1
pkgrel=1
pkgdesc="A Unicode character map for Windows."
arch=('any')
url="http://www.babelstone.co.uk/Software/BabelMap.html"
license=('custom')
depends=('wine' 'xdg-utils')
makedepends=('icoutils' 'imagemagick')
source=('http://www.babelstone.co.uk/Software/BabelMap.zip'
        'babelmap'
        'babelmap.desktop'
        'LICENSE')
sha256sums=('4d2e2725cad9eb5e7f44ef260848439541ac1c4918b772eda07333c2ac352068'
            '5d62cd3c9bf31ca196e98da3d2eff27c6642c05f8ad9893cd1e73cdf08eb1573'
            '332804bcab37fdf223a9b55cead76c1c12e4c0e7f3df1691c93c9ad98e537274'
            '90544b87643dad089f816791171a909827bbdce12df7113543d005ffbfb53d64')
install='babelmap.install'

build() {
  wrestool -x -n 131 BabelMap.exe > babelmap.ico 2>/dev/null
  convert babelmap.ico babelmap.png
}

package() {
  install -Dm755 "${srcdir}/BabelMap.exe" "${pkgdir}/usr/share/babelmap/BabelMap.exe"
  install -Dm755 "${srcdir}/babelmap" "${pkgdir}/usr/bin/babelmap"
  install -Dm644 "${srcdir}/babelmap.desktop" "${pkgdir}/usr/share/applications/babelmap.desktop"
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/babelmap/LICENSE"

  install -Dm644 "${srcdir}/babelmap-1.png" "${pkgdir}/usr/share/icons/hicolor/16x16/apps/babelmap.png"
  install -Dm644 "${srcdir}/babelmap-0.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/babelmap.png"
  install -Dm644 "${srcdir}/babelmap-2.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/babelmap.png"
}
