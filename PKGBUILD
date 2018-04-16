# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.11.0_RC1
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://github.com/rundeck/rundeck/"
license=('APACHE')
depends=('java-runtime')
makedepends=('java-environment')
source=("${pkgname}-${pkgver/_/-}.tar.gz::https://github.com/rundeck/rundeck/archive/v${pkgver/_/-}.tar.gz"
        'start.sh')
sha256sums=('14796c920991c91a30b0a055e6eab2e9218dbe7435dcc29b88e419f80ccdfcee'
            '02f7b0b770e44c182e9aa79f4381e0ded19b538dc6248708638dc3dfd01d64b9')

build() {
  cd "${srcdir}/rundeck-${pkgver/_/-}"

  if [[ -z "${JAVA_HOME// }" ]]; then
      export JAVA_HOME="/usr/lib/jvm/default"
  fi

  sh ./gradlew build
}

package() {
  install -D -m755 "${srcdir}/start.sh" "${pkgdir}/usr/bin/rundeck"
  install -D -m755 "${srcdir}/rundeck-${pkgver/_/-}/rundeck-launcher/launcher/build/libs/rundeck-launcher-${pkgver/_*/}-SNAPSHOT.jar" "${pkgdir}/usr/share/java/rundeck/rundeck-launcher.jar"
  install -D -m644 "${srcdir}/rundeck-${pkgver/_/-}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
