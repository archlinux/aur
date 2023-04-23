# Maintainer: Phillip Schichtel <phillip@schich.tel>
# Contributor:	Jesse Jaara	<gmail.com: jesse.jaara>
# Contributor:	p2k		<uni-ulm.de: Patrick.Schneider>

pkgname=ktlint
pkgver=0.49.0
pkgrel=1
pkgdesc="An anti-bikeshedding Kotlin linter with built-in formatter"
arch=('any')
url="https://ktlint.github.io/"
license=('MIT')
depends=('java-runtime>=8')
makedepends=(git)
validpgpkeys=(ADBC987D1A7B91DB6B0AAA81995EFBF4A3D20BEB)
source=("git+https://github.com/pinterest/ktlint.git#commit=30e20ecd176c97c1b703d791c8d2bf0aad52e8a2")
sha256sums=('SKIP')

build() {
  cd "ktlint"
  ./gradlew --no-configuration-cache --no-scan --no-daemon -Pktlint.publication.signing.enable=false shadowJarExecutable
}

package() {
  install -D -m755 "${srcdir}/ktlint/ktlint-cli/build/run/ktlint" "${pkgdir}/usr/bin/ktlint"
  install -D -m644 "${srcdir}/ktlint/LICENSE" "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

