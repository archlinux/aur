# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=jsimugate
pkgver=0.70
pkgrel=1
pkgdesc='Simulate standard logic and more'
arch=('any')
url="https://github.com/innovation-plantation/jsimugate"
license=('MIT')
depends=('java-environment>=8' 'bash')
makedepends=('gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/innovation-plantation/jsimugate/archive/${pkgver}.tar.gz")
sha256sums=('37a217c4d775b00565c8a5c5808dd83d13399da64f626e19a8773a81d6c08f76')

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 jsimugate.jar "${pkgdir}/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar"
  echo "#!/usr/bin/env bash
  java -jar /usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar \$\@" > jsimugate.sh
  install -Dm755 jsimugate.sh "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 src/jsimugate/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 classes/artifacts/jsimugate_jar/innovation-plantation.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "jSimuGate" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}