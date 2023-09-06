# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=1.0.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=(git)
validpgpkeys=(ADBC987D1A7B91DB6B0AAA81995EFBF4A3D20BEB)
source=("git+https://github.com/pinterest/ktlint.git#commit=fdb0506192e9ba742daec8ab8cd6098c772ee09b")
sha256sums=('SKIP')

build() {
  cd "ktlint"
  export GRADLE_USER_HOME="${srcdir}/.gradle"
  ./gradlew --no-configuration-cache --no-scan --no-daemon -Pktlint.publication.signing.enable=false shadowJarExecutable
}

package() {
  install -D -m755 "${srcdir}/ktlint/ktlint-cli/build/run/ktlint" "${pkgdir}/usr/bin/ktlint"
  install -D -m644 "${srcdir}/ktlint/LICENSE" "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

