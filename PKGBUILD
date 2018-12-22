# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=jdtls
pkgver=0.30.0
pkgrel=1
pkgdesc="Eclipse Java language server"
arch=(any)
url="https://github.com/eclipse/eclipse.jdt.ls"
license=('EPL')
depends=('java-runtime')
makedepends=('git' 'java-environment' 'maven')
source=("https://github.com/eclipse/eclipse.jdt.ls/archive/v${pkgver}.tar.gz"
        "launcher.sh")
md5sums=('a60b09d3de33e0abb78796c4c6bbf4ca'
         'd92f22ae00c112d65ef41fa5a578b55a')

build() {
    cd "${srcdir}/eclipse.jdt.ls-${pkgver}"
    mvn -Pserver-distro -Dmaven.repo.local="${srcdir}/repo" clean package
}

package() {
    mkdir -p "${pkgdir}/usr/share/java/jdtls"
    tar -xzf "${srcdir}/eclipse.jdt.ls-${pkgver}/org.eclipse.jdt.ls.product/distro/jdt-language-server-${pkgver}-"*.tar.gz -C "${pkgdir}/usr/share/java/jdtls"
    mkdir -p "${pkgdir}/usr/bin"
    install "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/jdtls"
}
