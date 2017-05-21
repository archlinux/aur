# Maintainer: grimsock <lord.grimsock at gmail dot com>
# Contributor: Julien Nicoulaud <julien.nicoulaud@gmail.com>

pkgname=gatling-stress-tool # Name collision with https://aur.archlinux.org/packages.php?ID=7159
_pkgname=gatling
pkgver=2.2.5
pkgrel=1
pkgdesc="Open-source load testing framework based on Scala, Akka and Netty"
arch=(any)
url="http://gatling.io"
license=('apache')
depends=('java-environment-common')
backup=(usr/share/java/${pkgname}/conf/{application,gatling,recorder}.conf
        usr/share/java/${pkgname}/conf/logback.xml)
source=("https://repo1.maven.org/maven2/io/gatling/highcharts/gatling-charts-highcharts-bundle/${pkgver}/gatling-charts-highcharts-bundle-${pkgver}-bundle.zip"
        "gatling"
        "gatling-recorder")
sha256sums=('381f49c57226b1648d0f346960cbb623c319f622630586e11edc0e005c4a6ab7'
            'b537f7c31f0fe66b291f30e05498c7412e01bf4572abaea0a07823b2cf4f07d9'
            '6124d91ec20c2d495cf9b2867027251c12db478da4429982d7794a356d56aebf')

package() {
  # bin
  install -Dm 755 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/bin/${_pkgname}.sh" "${pkgdir}/usr/share/java/${pkgname}/bin/${_pkgname}.sh"
  install -Dm 755 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/bin/recorder.sh" "${pkgdir}/usr/share/java/${pkgname}/bin/recorder.sh"
  # conf
  confs=`ls "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/conf/"`
  for conf in $confs; do
    install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/conf/${conf}" "${pkgdir}/usr/share/java/${pkgname}/conf/${conf}"
  done
  # lib
  jars=`find "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/lib/" -maxdepth 1 -type f -printf '%f\n'`
  for jar in $jars; do
    install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/lib/${jar}" "${pkgdir}/usr/share/java/${pkgname}/lib/${jar}"
  done
  # lib/zinc
  zinc_jars=`ls "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/lib/zinc/"`
  for zinc_jar in $zinc_jars; do
    install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/lib/zinc/${zinc_jar}" "${pkgdir}/usr/share/java/${pkgname}/lib/zinc/${zinc_jar}"
  done
  # results
  install -dm 644 "${pkgdir}/usr/share/java/${pkgname}/results"
  # user-files
  install -dm 644 "${pkgdir}/usr/share/java/${pkgname}/user-files/bodies"
  install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/user-files/data/search.csv" "${pkgdir}/usr/share/java/${pkgname}/user-files/data/search.csv"
  install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/user-files/simulations/computerdatabase/BasicSimulation.scala" "${pkgdir}/usr/share/java/${pkgname}/user-files/simulations/computerdatabase/BasicSimulation.scala"
  scala_files=`ls "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/user-files/simulations/computerdatabase/advanced/"`
  for scala_file in $scala_files; do
    install -Dm 644 "${srcdir}/${_pkgname}-charts-highcharts-bundle-${pkgver}/user-files/simulations/computerdatabase/advanced/${scala_file}" "${pkgdir}/usr/share/java/${pkgname}/user-files/simulations/computerdatabase/advanced/${scala_file}"
  done

  install -Dm 755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 755 "${_pkgname}-recorder" "${pkgdir}/usr/bin/${_pkgname}-recorder"
}
