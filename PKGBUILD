# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=ginj
pkgver=0.3.3
pkgrel=1
pkgdesc="An open source multi-platform screen capture and recording tool"
arch=('any')
url='http://ginj.info'
license=('GPL')
depends=('java-runtime>=14' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.jar::https://github.com/Ginj-capture/Ginj/releases/download/v${pkgver}/Ginj-${pkgver}.jar"
        'ginj.png::https://github.com/Ginj-capture/Ginj/raw/master/www/logo.png')
sha256sums=('69e6ac114a67bbf7ec6cc1f3a4faf06abfd7d1f474f52b93960b55c23875889e'
            '31364af43dbba74f407067afd6318dd7fbe073d35a70df71d301fcea01ddfcfc')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/usr/bin/env bash
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > ginj.sh
  install -Dm755 ginj.sh "${pkgdir}/usr/bin/ginj"
  install -Dm644 ginj.png -t "${pkgdir}/usr/share/pixmaps/"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Ginj" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}