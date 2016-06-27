# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.6.8
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="http://messengerfordesktop.com/"
license=('APACHE')
depends=('java-environment' 'bash')
source=("https://github.com/rundeck/rundeck/archive/v${pkgver}.tar.gz"
        'start.sh')
md5sums=('7b8991d4530406f88884a2bed9df0d04'
         '520c429435ea55c694b66dfa969f98ca')

build() {
  cd "${srcdir}/rundeck-${pkgver}"

  if [[ -z "${JAVA_HOME// }" ]]; then
      export JAVA_HOME="/usr/lib/jvm/default"
  fi

  sh ./gradlew build
}

package() {
  install -D -m755 "${srcdir}/start.sh"	"${pkgdir}/usr/bin/rundeck"
  install -D -m755 "${srcdir}/rundeck-${pkgver}/rundeck-launcher/launcher/build/libs/rundeck-launcher-${pkgver}-SNAPSHOT.jar" "${pkgdir}/usr/share/java/rundeck/rundeck-launcher.jar"
  install -D -m644 "${srcdir}/rundeck-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
