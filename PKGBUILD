# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=comixed
pkgver=0.6.0
pkgrel=1
pkgdesc="An application for managing digital comics"
arch=('any')
url='https://github.com/mcpierce/comixed'
license=('GPL3')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.zip::https://github.com/comixed/comixed/releases/download/v${pkgver}-1/comixed-app-${pkgver}-1-RELEASE.zip"
        'comixed.service')
sha256sums=('55a2132f64ae82a1d333263d7399d892487dead77a0593fad45c75297d34f7f8'
            'SKIP')

prepare() {
  sed -i "24s|.*|COMIXED_JAR_FILE=/usr/share/java/${pkgname}/comixed-app-*.jar|" comixed-app-${pkgver}-1/bin/run.sh
}

package() {
  install -Dm644 comixed-app-${pkgver}-1/bin/comixed-app-${pkgver}-1.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm755 comixed-app-${pkgver}-1/bin/run.sh "${pkgdir}/usr/bin/comixed"
  install -Dm644 comixed.service -t "${pkgdir}/usr/lib/systemd/system/"
}