# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=comixed
pkgver=0.7.1
pkgrel=1
pkgdesc="An application for managing digital comics"
arch=('any')
url='https://github.com/mcpierce/comixed'
license=('GPL3')
depends=('java-runtime>=8' 'bash')
source=("${pkgname}-${pkgver}-2.1.zip::https://github.com/comixed/comixed/releases/download/v${pkgver}-2.1/comixed-release-${pkgver}-2.1-RELEASE.zip"
        'comixed.service')
sha256sums=('3c98e744636433f886e0d65a0abbebc1edf51257506c66e6cfec4d0557e8bdc0'
            '55c24b6d270444ad8cc141f9ed94851aa8e12358b15072eabac346e3f8a1eb82')

prepare() {
  sed -i "24s|.*|COMIXED_JAR_FILE=/usr/share/java/${pkgname}/comixed-app-*.jar|" comixed-release-${pkgver}-2.1/bin/run.sh
}

package() {
  install -Dm644 comixed-release-${pkgver}-2.1/bin/comixed-app-${pkgver}-2.1.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  install -Dm755 comixed-release-${pkgver}-2.1/bin/run.sh "${pkgdir}/usr/bin/comixed"
  install -Dm644 comixed.service -t "${pkgdir}/usr/lib/systemd/system/"
}
