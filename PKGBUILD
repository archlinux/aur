# Maintainer: Vitalij Berdinskih <vitalij_r2@outlook.com>

pkgname=ridecost
pkgver=1.0.0
pkgrel=1
pkgdesc="Mileage-Based Ride Cost Command-Line Tool."
arch=("any")
url="https://gitlab.com/ride-cost/ride-cost-cli"
license=('Apache 2')
depends=('java-runtime>=17' 'archlinux-java-run' 'bash')
source=("${pkgname}-${pkgver}.zip::https://gitlab.com/ride-cost/ride-cost-cli/-/archive/v1.0.0/ride-cost-cli-v${pkgver}.tar.bz2"
         ${pkgname}.sh)

build() {
  cd ride-cost-cli-v${pkgver}
  ./mvnw -Pprepare-package
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -m 755 $pkgname.sh "${pkgdir}"/usr/bin/${pkgname}

  cd ride-cost-cli-v${pkgver}/target

  install -Dm644 ride-cost-cli-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
  install -m644 dependency/*.jar -t "${pkgdir}"/usr/share/java/${pkgname}
}

sha256sums=('8f64f25a7cd4ae26708f60b8c65df1444f7f708abd4b102861a3912f70a09ff5'
            '9ad9cb0cd127fcef26016d7b82df2cc3a06f41ba8f522bcab25cbb17bf34bb4f')
