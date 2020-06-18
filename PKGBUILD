# Maintainer: Wilhelm Schuster <aur [at] rot13 (dot) io>

pkgname=typometer
pkgver=1.0.1
pkgrel=2
pkgdesc="Terminal/Editor typing latency analyzer"
arch=('any')
url="https://pavelfatin.com/typometer"
license=('Apache')
depends=('java-runtime')
makedepends=('maven')
source=("$pkgname-$pkgver.tar.gz::https://github.com/pavelfatin/typometer/archive/v${pkgver}.tar.gz"
        "${pkgname}.sh"
        "${pkgname}.desktop")
sha512sums=('a3bcfddb5cab097a9b4f65bf4902f210b511dcb0ee7b516a8bbfce82c0ca87584edc2fb64e38b4f9901f5420df05a850e2d952177a67e144306d36e3fcf85906'
            '90ccb85ea90182a8f3cb5af26bd4f104cc23aefaedf0c6752d17055bdd4b2adb77ebc73212badbcb8b07a3f591fe375753f912760713a701147f67a3d29db315'
            '288764ec8e81c66e0e590061a16a3157a60f56a72ba2b3a4b1608d3b7e5ced63ebd84592ec2d22c01ff38c780c24ce41158f2547cc998bf32b4b6373d81d32ff')

build() {
  cd "$pkgname-$pkgver"

  mvn clean package -Dmaven.test.skip=true
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm 644 "target/${pkgname}-${pkgver}.jar" -T "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"
  install -Dm 755 "${srcdir}/${pkgname}.sh" -T "${pkgdir}/usr/bin/${pkgname}"
  # XDG desktop file
  install -Dm 644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}

