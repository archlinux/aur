pkgname=maestro
pkgver=2.5.1
pkgrel=1
pkgdesc='Mobile UI testing framework'
arch=('any')
url='https://maestro.dev'
license=('Apache-2.0')
depends=('bash' 'java-runtime-headless>=17')
makedepends=('java-environment>=17')
conflicts=('maestro-bin' 'maestro-dev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mobile-dev-inc/maestro/archive/refs/tags/cli-${pkgver}.tar.gz")
sha256sums=('6561f4e78f7a3f8781f8a5abdbc79386443de27f42fc60640cce21a1cf9f0a3c')

build() {
  cd "Maestro-cli-${pkgver}"
  GRADLE_USER_HOME="$srcdir/.gradle" ./gradlew --no-daemon :maestro-cli:installDist
}

package() {
  cd "Maestro-cli-${pkgver}"
  install -d "$pkgdir/opt/maestro" "$pkgdir/usr/bin"
  cp -a maestro-cli/build/install/maestro/. "$pkgdir/opt/maestro/"
  ln -s /opt/maestro/bin/maestro "$pkgdir/usr/bin/maestro"
}
