# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=openbeans-bin
pkgver=2019.12
pkgrel=1
pkgdesc="An IDE distribution. It packages the best there is in the ecosystem, polishes it, fixes minor annoyances and serves them to you in a clean bundle. Formerly CoolBeans"
arch=('i686' 'x86_64')
url='http://www.openbeans.org'
license=('ISC')
provides=('openbeans')
depends=('java-environment>=8'
         'lib32-gcc-libs'
         'python'
         'bash')
options=('!strip')
source=("${pkgname}-${pkgver}.tgz::https://github.com/OpenBeans/OpenBeans/releases/download/${pkgver}/OpenBeans-${pkgver}.tgz")
sha256sums=('003462dbafde3d0b9779dfcbfbfebd9f5f085473a92639d481a8ab6015f0fe0d')

package() {
  cd "${pkgname%-bin}-${pkgver}"
  install -Dm644 nb/netbeans.png "${pkgdir}/usr/share/pixmaps/openbeans.png"
  install -Dm644 nb/shortcuts.pdf -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -d "${pkgdir}/usr/bin/" "${pkgdir}/opt/"
  ln -s /opt/openbeans/bin/netbeans "${pkgdir}/usr/bin/openbeans"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "OpenBeans" \
          --comment "$pkgdesc" \
          --exec 'openbeans --jdkhome /usr/lib/jvm/default-runtime' \
          --categories 'Development;Application;' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
  cd "${srcdir}"
  cp -aR "${pkgname%-bin}-${pkgver}" "${pkgdir}/opt/openbeans"
}