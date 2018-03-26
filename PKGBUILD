# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.10.8
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://github.com/rundeck/rundeck/"
license=('APACHE')
depends=('java-runtime')
makedepends=('java-environment')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rundeck/rundeck/archive/v${pkgver}.tar.gz"
        'start.sh')
sha256sums=('06c714a71853309e86f1e58c0d0aa721f0017717d47ee78cb46f4b25614f91c0'
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
