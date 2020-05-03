# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=cerberus-x-bin
pkgver=2019.10.13b
_pkgver=2019-10-13
pkgrel=1
pkgdesc="A game development language, made for hobbyists, indies and professionals"
arch=('x86_64')
url="https://www.cerberus-x.com"
license=('Zlib/libpng')
provides=('cerberus-x')
makedepends=('gendesk')
install=cerberus-x.install
options=('!strip')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MikeHart66/cerberus/releases/download/v${_pkgver}/cerberus-v${_pkgver}b.tar.gz")
sha256sums=('d1a4f16bcffbce52ae51277d04e0a807567fc3f597fee1c6f1b82e4f3df989d6')

package() {
  install -d "${pkgdir}/opt/" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/" \
   "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  mv -v "${srcdir}/Cerberus" "${pkgdir}/opt/${pkgname%-bin}"
  mv -v "${pkgdir}/opt/${pkgname%-bin}/license" "${pkgdir}/usr/share/licenses/${pkgname%-bin}/LICENSE"
  ln -s /opt/${pkgname%-bin}/Cerberus "${pkgdir}/usr/bin/cerberus"
  cd "${pkgdir}/opt/${pkgname%-bin}/bin"
  ./makedocs_linux # Generate docs
  install -dm757 ted_linux_$(uname --nodename).ini/Cerberus\ X 
  chmod 757 ted_linux_$(uname --nodename).ini
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Cerberus X" \
          --comment "$pkgdesc" \
          --exec cerberus \
          --categories 'Development;Application' \
          --icon cerberus
  mv -v cerber*.desktop "${pkgdir}/usr/share/applications/cerberus-x.desktop"
  install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/docs/templates/cerberusx3/data/cerberusx.png" "${pkgdir}/usr/share/pixmaps/cerberus.png"
}