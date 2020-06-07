# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=socomo
pkgver=2.1.0
pkgrel=1
pkgdesc="Tool to visualize and maintain the composition of java code"
arch=('any')
url='https://github.com/gdela/socomo'
license=('MIT')
depends=('java-runtime>=8' 'bash')
noextract=("${pkgname}-${pkgver}.jar")
source=("${pkgname}-${pkgver}.jar::https://github.com/gdela/socomo/releases/download/v${pkgver}/socomo-standalone-${pkgver}.jar"
        'LICENSE::https://github.com/gdela/socomo/raw/master/license.md')
sha256sums=('f82f895ceecd2abd10a8438c94d94ac1fb145da7e0bfc9805c3d0b7fbbd52b9c'
            'db03e299eba85a089575ee5d09be97e345aa80e5164a5ce5a58ed424b1059be9')

package() {
  install -Dm644 ${pkgname}-${pkgver}.jar -t "${pkgdir}/usr/share/java/${pkgname}"
  echo "#!/bin/sh
  exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar' "\$\@"" > socomo.sh
  install -Dm755 socomo.sh "${pkgdir}/usr/bin/socomo"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}