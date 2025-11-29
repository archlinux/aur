# Maintainer: Vitalij Berdinskih <vitalij_r2@outlook.com>

pkgname=ridecost
pkgver=1.1.1
pkgrel=1
pkgdesc="Mileage-Based Ride Cost Command-Line Tool."
arch=("any")
url="https://gitlab.com/ride-cost/ride-cost-cli"
license=('Apache 2')
depends=('java-runtime>=17' 'archlinux-java-run' 'bash')
optdepends=('slf4j: logging library')
source=("${pkgname}-${pkgver}.tar.bz2::https://gitlab.com/ride-cost/ride-cost-cli/-/archive/v${pkgver}/ride-cost-cli-v${pkgver}.tar.bz2"
         ${pkgname}.sh)

build() {
  cd ride-cost-cli-v${pkgver}
  ./mvnw -Pprepare-package -DexcludeGroupIds=org.slf4j
}

package() {
  install -d "${pkgdir}"/usr/bin
  install -m 755 $pkgname.sh "${pkgdir}"/usr/bin/${pkgname}

  cd ride-cost-cli-v${pkgver}/target

  install -Dm644 ride-cost-cli-${pkgver}.jar "${pkgdir}"/usr/share/java/${pkgname}/${pkgname}-${pkgver}.jar
  install -m644 dependency/*.jar -t "${pkgdir}"/usr/share/java/${pkgname}
}

sha256sums=('3650971b5f262929fad22dbea685bf455f358c1af2c9c220ba5a3bea8bf3dcc8'
            '63f1f5855132ecef82b4551c276bfd20ef3e627262d3553aa391e4fa65038959')
