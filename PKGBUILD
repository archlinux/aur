# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.9.2
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://github.com/rundeck/rundeck/"
license=('APACHE')
depends=('java-runtime')
makedepends=('java-environment')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rundeck/rundeck/archive/v${pkgver}.tar.gz"
        'start.sh')
sha256sums=('e54bc6085db6c754a16dee83e73e57993a5bb21f625b1556da3c824266d5ecad'
            '02f7b0b770e44c182e9aa79f4381e0ded19b538dc6248708638dc3dfd01d64b9')

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
