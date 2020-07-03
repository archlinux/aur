# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=qilin-bin
_pkgver=0.4.0-alpha
pkgver=0.4.0.alpha
pkgrel=1
pkgdesc="Fully hackable text editor developed for exact sciences with built-in KaTeX and AsciiMath support. Extensible via plugins and themes. Exportable as HTML, PDF and GFM"
arch=('x86_64')
url='https://github.com/qilin-editor/qilin-app'
license=('MIT')
provides=("${pkgname%-bin}")
depends=('gconf'
         'gtk3'
         'libxss'
         'nss')
source=("${pkgname}-${pkgver}.zip::https://github.com/qilin-editor/qilin-app/releases/download/v${_pkgver}/qilin-linux.zip"
        'LICENSE::https://github.com/qilin-editor/qilin-app/raw/development/LICENSE'
        'qilin.jpg')
sha256sums=('ecbece01202b798b302888c90afc1f17a724724e7a2804c7b6099a2878e146b9'
            'ec0396128f95d9c57076bbcc334684707c145530bc799ce5c55abdd903935bfe'
            'SKIP')

package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin"
  cp -vR linux64 "${pkgdir}/opt/Qilin"
  ln -s /opt/Qilin/me.laniewski.qilin "${pkgdir}/usr/bin/qilin"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Qilin Editor" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 qilin.jpg -t "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}