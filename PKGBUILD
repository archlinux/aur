# Maintainer: kj_sh604 <406hs_jk@proton.me>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=lanxchange
pkgver=1.41
pkgrel=3
pkgdesc="Configuration-free, cross-platform file transfers for your local network"
arch=('any')
url='https://lanxchange.com'
license=('GPL3')
install=lanxchange.install
depends=('java-runtime>=8' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.zip::https://github.com/tfg13/LanXchange/releases/download/v${pkgver}/lxc.zip")
sha256sums=('18fb4e05a8cf858baf1ff3b079be63eb6228424eb5de596f3cc604dbb8fa2102')

package() {
  install -Dm644 ${pkgname}.jar "${pkgdir}/opt/${pkgname}/${pkgname}-${pkgver}.jar"
  cp -avR img/ "${pkgdir}/opt/${pkgname}/"
  echo "#!/usr/bin/env bash
  cd /opt/lanxchange
  exec /usr/bin/java -splash:img/logo.png -jar '/opt/${pkgname}/${pkgname}-${pkgver}.jar' "-managed \$\@"" > lanxchange.sh
  install -Dm755 lanxchange.sh "${pkgdir}/usr/bin/lxcr"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "LanXchange" \
          --comment "$pkgdesc" \
          --exec lxcr \
          --categories 'Network;Application' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 img/logo.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  chmod -R 777 "${pkgdir}/opt/lanxchange/"
}
