# Maintainer: niyanhhhhh <2093615664@qq.com>

pkgname=mvnd
pkgver=0.6.0
pkgrel=1
pkgdesc="Maven Deamon, which aims at providing faster Maven builds using techniques known from Gradle and Takari."
arch=(x86_64)
url=https://github.com/mvndaemon/mvnd
license=('Apache')
depends=('java-environment>=7' 'bash' 'maven')
source=("${pkgname}-${pkgver}.zip::https://github.com/mvndaemon/mvnd/releases/download/${pkgver}/${pkgname}-${pkgver}-linux-amd64.zip")
sha256sums=('d01e7d7ed9799c83b3a56c7c17d153e161bd0d91e26550584fdfc1ef7e985575')
install=.install

package() {
    mkdir -p "${pkgdir}/usr/bin"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/bin"
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}/mvn/bin"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/mvn"
    mkdir -p "${pkgdir}/usr/share/bash-completion/completions"

    cd "${srcdir}/${pkgname}-${pkgver}-linux-amd64"

    install -m755 bin/*.* "${pkgdir}/usr/share/java/${pkgname}/bin/"
    install -m755 bin/mvnd "${pkgdir}/usr/share/java/${pkgname}/bin/"
    install -m755 mvn/bin/*.* "${pkgdir}/usr/share/java/${pkgname}/mvn/bin/"
    cp -r conf "${pkgdir}/usr/share/java/${pkgname}"
    cp -r mvn "${pkgdir}/usr/share/java/${pkgname}"

    install LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    install NOTICE.txt "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE.txt"
    install mvn/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/LICENSE"
    install mvn/NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/mvn/NOTICE"
    install mvn/README.txt "${pkgdir}/usr/share/licenses/${pkgname}/mvn/README.txt"
    install bin/mvnd-bash-completion.bash "${pkgdir}/usr/share/bash-completion/completions/mvnd"

    ln -s "/usr/share/java/${pkgname}/bin/mvnd" "${pkgdir}/usr/bin/mvnd"
    ln -s "/usr/share/java/${pkgname}/bin/mvn-sync" "${pkgdir}/usr/bin/mvn-sync"
}

