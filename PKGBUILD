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
# See: https://github.com/pinterest/ktlint#installation
source=(ktlint-${pkgver}::"git+https://github.com/pinterest/ktlint.git#tag=${pkgver}")
sha256sums=('SKIP')

build() {
  cd "ktlint-${pkgver}"
  ./gradlew --no-configuration-cache --no-scan --no-daemon -Pktlint.publication.signing.enable=false shadowJarExecutable
}

package() {
  install -D -m755 "${srcdir}/ktlint-${pkgver}/ktlint-cli/build/run/ktlint" "${pkgdir}/usr/bin/ktlint"
  install -D -m644 "${srcdir}/ktlint-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/ktlint/LICENSE"
}

