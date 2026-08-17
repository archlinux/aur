# Maintainer: Olli <olli@suruatoel.xyz>
pkgname=sonarlint-ls
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-language-server
pkgver=5.8.0.78640
pkgrel=1
pkgdesc="Language Server for SonarQube for VSCode"
license=('LGPLv3')
depends=('java-runtime>=17')
makedepends=('maven')
conflicts=('sonarlint-ls-bin')
source=("https://github.com/SonarSource/sonarlint-language-server/archive/refs/tags/${pkgver}.tar.gz" 'sonarlint-ls')
sha256sums=('60e3e68f8283137e619387ca014bfcc3482e2c07330cde93e3e28b021762ddc3' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4')

prepare() {
    cd "${srcdir}/sonarlint-language-server-${pkgver}"
    mvn --no-transfer-progress versions:set -DprocessAllModules "-DnewVersion=${pkgver}"
}

build() {
    cd "${srcdir}/sonarlint-language-server-${pkgver}"
    mvn --no-transfer-progress package -DskipTests
}

package() {
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/sonarlint-ls" "${pkgdir}/usr/bin/sonarlint-ls"
    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/sonarlint-language-server-${pkgver}.jar" "${pkgdir}/usr/share/java/sonarlint-ls/sonarlint-ls.jar"

    mkdir -p "${pkgdir}/usr/share/java/sonarlint-ls/analyzers"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonargo.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarhtml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonariac.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarjava.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarjavasymbolicexecution.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarjs.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarlintomnisharp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarphp.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarpython.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonartext.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
    install "${srcdir}/sonarlint-language-server-${pkgver}/target/plugins/sonarxml.jar" "${pkgdir}/usr/share/java/sonarlint-ls/analyzers/"
}
