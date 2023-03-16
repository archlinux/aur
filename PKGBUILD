# Maintainer: Marc Schreiber <info@schrieveslaach.de>
pkgname=sonarlint-ls
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-language-server
pkgver=2.15.1.63583
pkgrel=1
pkgdesc="SonarLint language server (used by SonarLint VSCode)"
license=('LGPLv3')
depends=('java-runtime>=11')
makedepends=('git' 'maven')
source=("https://github.com/SonarSource/sonarlint-language-server/archive/refs/tags/${pkgver}.tar.gz" 'sonarlint-ls')
sha256sums=('da29858824dca23f0d228f0e182de654bb01d9dc8f07b80e9250daa70ce3a288' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4')

prepare() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress versions:set -DprocessAllModules "-DnewVersion=${pkgver}"
}

build() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress package -DskipTests
}

check() {
   cd "${srcdir}/sonarlint-language-server-${pkgver}"
   mvn --no-transfer-progress test
}

package() {
   mkdir -p "${pkgdir}/usr/bin"
   install "${srcdir}/sonarlint-ls" "${pkgdir}/usr/bin/sonarlint-ls"
   mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls"
   install "${srcdir}/sonarlint-language-server-${pkgver}/target/sonarlint-language-server-${pkgver}.jar" "${pkgdir}/usr/share/java/sonarlint-ls/sonarlint-ls.jar"
}
