# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=rundeck
pkgver=2.11.1
pkgrel=1
pkgdesc="Open source automation service with a web console, command line tools and a WebAPI"
arch=('any')
url="https://github.com/rundeck/rundeck/"
license=('APACHE')
depends=('java-runtime')
makedepends=('java-environment')
source=("${pkgname}-${pkgver/_/-}.tar.gz::https://github.com/rundeck/rundeck/archive/v${pkgver/_/-}.tar.gz"
        'start.sh')
sha256sums=('492e3b2be62c1d032ae91594f5aad6021319cad1519befbae8ab471b7807b12a'
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
