pkgname=maestro
pkgver=2.6.1
pkgrel=1
pkgdesc='Mobile UI testing framework'
arch=('any')
url='https://maestro.dev'
license=('Apache-2.0')
depends=('bash' 'java-runtime-headless>=17')
makedepends=('java-environment>=17')
conflicts=('maestro-bin' 'maestro-dev')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mobile-dev-inc/maestro/archive/refs/tags/cli-${pkgver}.tar.gz")
sha256sums=('414e6786765d0b4dd467671ee66d7305ce48295ccfe0138515e9f3da6f45e8cd')

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
