# Maintainer: Chanathip Srithanrat <axesd9@gmail.com>

pkgname=sbt-latest
_pkgname=${pkgname%-*}
pkgver=1.0.0
pkgrel=2
pkgdesc='A build tool for Scala, Java, and more'
arch=('any')
url='http://www.scala-sbt.org/'
license=('BSD')
depends=('jre8-openjdk-headless'
         'rsync'
         'sh')
conflicts=('sbt')
source=("https://github.com/sbt/sbt/releases/download/v${pkgver}/sbt-${pkgver}.tgz"
        "https://raw.githubusercontent.com/${_pkgname}/${_pkgname}/v${pkgver}/LICENSE")
sha256sums=('9ae04f4972145f2ac56c4deb868c9a5bb8b8b85c5151885dff3b997712645c5a'
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
