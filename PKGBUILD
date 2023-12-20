# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=1.1.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime>=11')
makedepends=(git 'jdk-openjdk>=21')
validpgpkeys=(ADBC987D1A7B91DB6B0AAA81995EFBF4A3D20BEB)
source=("git+https://github.com/pinterest/ktlint.git#commit=ebfe2d022ecf082c180e761c8f07f82caebd1561")
sha256sums=('SKIP')

_gradle_build() {
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
  ./gradlew --no-configuration-cache --no-scan --no-daemon --console plain -Pktlint.publication.signing.enable=false shadowJarExecutable
}

build() {
  cd "ktlint"
  _gradle_build || _gradle_build
}

package() {
  install -D -m755 "${srcdir}/ktlint/ktlint-cli/build/run/ktlint" "${pkgdir}/usr/bin/ktlint"
  install -D -m644 "${srcdir}/ktlint/LICENSE" "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

