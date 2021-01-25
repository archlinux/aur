# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=kotlin-language-server
pkgver=0.7.0
pkgrel=2
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/KotlinLanguageServer"
license=('MIT')
conflicts=('kotlin-language-server-git')
provides=('kotlin-language-server')
depends=('java-runtime>=14')
makedepends=('java-environment>=14')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('d795c8105aff7f5414609466bf18964b6cc37215ed14ca88294fe506ba74efa4')

build() {
    export JAVA_HOME="/usr/lib/jvm/java-15-openjdk"
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./gradlew server:installDist
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/kotlin" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${pkgname}-${pkgver}/server/build/install/server/" \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server"
    ln -srf \
      "${pkgdir}/usr/share/kotlin/kotlin-language-server/bin/kotlin-language-server" \
      "${pkgdir}/usr/bin/kotlin-language-server"
}

