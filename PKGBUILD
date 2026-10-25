# Maintainer: Olli <olli@suruatoel.xyz>
pkgname=sonarlint-ls
arch=('x86_64')
url=https://github.com/SonarSource/sonarlint-language-server
pkgver=6.2.0.79823
pkgrel=2
pkgdesc="Language Server for SonarQube for VSCode"
license=('LGPL-3.0-or-later')
depends=('java-runtime>=17')
makedepends=('maven')
conflicts=('sonarlint-ls-bin')
source=("https://github.com/SonarSource/sonarlint-language-server/archive/refs/tags/${pkgver}.tar.gz" 'sonarlint-ls')
sha256sums=('d5d05879364bc02cf22d01f19448b716b5c0fc0fc8041ad0fbcc576c5709dcf8' 'b951d9b6f1e1f9f70430776d958487b385cc8290c0a48335d938b3128e1a80c4')

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
