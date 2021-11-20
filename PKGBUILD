# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=kotlin-language-server
pkgver=1.2.0
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/KotlinLanguageServer"
license=('MIT')
conflicts=('kotlin-language-server-git')
provides=('kotlin-language-server')
depends=('java-runtime>=11')
makedepends=('java-environment>=11')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('2121a678d9c6ae2c80a74f3036ccc18fb778fe1ef25a527b3083d24c7c1bbf75')

build() {
    jdk="$(find /usr/lib/jvm -maxdepth 1 -name "*1*" | head -1)" &&
      test -n "$jdk" && export JAVA_HOME="$jdk"
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

