# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=sbt-latest
_pkgname=${pkgname%-*}
pkgver=0.13.15
pkgrel=4
pkgdesc='A build tool for Scala, Java, and more'
arch=('any')
url='http://www.scala-sbt.org/'
license=('BSD')
depends=('rsync'
         'sh')
conflicts=('sbt')
source=("https://dl.bintray.com/${_pkgname}/native-packages/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tgz"
        "https://raw.githubusercontent.com/${_pkgname}/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('b6e073d7c201741dcca92cfdd1dd3cd76c42a47dc9d8c8ead8df7117deed7aef'
            '70b7b72694a56a3e922deaf5482273e7c33bab2c00c0c67fc0ccc5d33927ffed')

package() {
  cd "${srcdir}/${_pkgname}"

  install -D -m 644 bin/java9-rt-export.jar -t "${pkgdir}"/usr/share/${pkgname}/bin
  install -D -m 644 bin/sbt-launch.jar -t "${pkgdir}"/usr/share/${pkgname}/bin
  install -D -m 755 bin/sbt -t "${pkgdir}"/usr/share/${pkgname}/bin
  install -D -m 755 bin/sbt-launch-lib.bash -t "${pkgdir}"/usr/share/${pkgname}/bin
  mkdir -p "${pkgdir}"/usr/bin
  ln -s /usr/share/${pkgname}/bin/java9-rt-export.jar "${pkgdir}"/usr/bin/java9-rt-export.jar
  ln -s /usr/share/${pkgname}/bin/sbt "${pkgdir}"/usr/bin/sbt

  install -D -m 644 conf/sbtconfig.txt -t "${pkgdir}"/usr/share/${pkgname}/conf
  install -D -m 644 conf/sbtopts -t "${pkgdir}"/usr/share/${pkgname}/conf
  mkdir "${pkgdir}"/etc
  ln -s /usr/share/${pkgname}/conf "${pkgdir}"/etc/${_pkgname}

  cp -r lib "${pkgdir}"/usr/share/${pkgname}

  install -D "${srcdir}"/LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
