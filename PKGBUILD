# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=comixed
pkgver=0.7.0
pkgrel=1
pkgdesc="An application for managing digital comics"
arch=('any')
url='https://github.com/mcpierce/comixed'
license=('GPL3')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}.zip::https://github.com/comixed/comixed/releases/download/v${pkgver}-3.1/comixed-release-${pkgver}-3.1-GA.zip"
        'comixed.service')
sha256sums=('a94b4c075b19bbd0581f6cf2ea7a78d24f36a768be1246c0469f4e079f86a778'
            '55c24b6d270444ad8cc141f9ed94851aa8e12358b15072eabac346e3f8a1eb82')

prepare() {
  sed -i "24s|.*|COMIXED_JAR_FILE=/usr/share/java/${pkgname}/comixed-app-*.jar|" comixed-release-${pkgver}-3.1/bin/run.sh
}

package() {
  install -Dm644 comixed-release-${pkgver}-3.1/bin/comixed-app-${pkgver}-3.1.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm755 comixed-release-${pkgver}-3.1/bin/run.sh "${pkgdir}/usr/bin/comixed"
  install -Dm644 comixed.service -t "${pkgdir}/usr/lib/systemd/system/"
}
