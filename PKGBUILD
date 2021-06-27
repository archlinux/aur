# Maintainer: niyanhhhhh <2093615664@qq.com>

pkgname=mvnd
pkgver=0.5.2
pkgrel=1
pkgdesc="Maven Deamon, which aims at providing faster Maven builds using techniques known from Gradle and Takari."
arch=(x86_64)
url=https://github.com/mvndaemon/mvnd
license=('Apache')
depends=('java-environment>=7' 'bash' 'maven')
source=("${pkgname}-${pkgver}.zip::https://github.com/mvndaemon/mvnd/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-amd64.zip")
sha256sums=('55201c347a95a6df7600d988cc3ab71323f5eef627a1a3e9808ed2212c5a0987')
install=.install

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/bin"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/conf"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/bin"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/boot"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/lib/ext"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/conf/logging"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/mvn"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

    cd "${srcdir}/${pkgname}-${pkgver}-linux-amd64"

    install -m755 bin/*.* "${pkgdir}/usr/share/java/${pkgname}/bin/"
    install -m755 bin/mvnd "${pkgdir}/usr/share/java/${pkgname}/bin/"
    install conf/*.* "${pkgdir}/usr/share/java/${pkgname}/conf/"
    install conf/*.* "${pkgdir}/usr/share/java/${pkgname}/conf/"
    install -m755 mvn/bin/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/bin/"
    install mvn/conf/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/conf/"
    install mvn/conf/logging/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/conf/logging/"
    install mvn/lib/ext/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/lib/ext/"
    install mvn/lib/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/lib/"
    install mvn/boot/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/boot/"

    install LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
    install mvn/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/LICENSE"
    install mvn/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/NOTICE"
    install mvn/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/mvn/README.txt"
    install bin/mvnd-bash-completion.bash "${pkgdir}/usr/share/bash-completion/completions/mvnd"

    ln -s "/usr/share/java/${pkgname}/bin/mvnd" "${pkgdir}/usr/bin/mvnd"
}

