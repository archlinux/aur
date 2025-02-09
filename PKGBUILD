# Maintainer: Ricardo Grim Cabrita <grim@kriegor.net>

pkgname=kotlin-language-server
pkgver=1.3.13
pkgrel=1
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/kotlin-language-server"
license=('MIT')
conflicts=('kotlin-language-server-git')
provides=('kotlin-language-server')
depends=('java-runtime=11')
makedepends=('java-environment=11')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('4cb346f989ef114f6073cb9401968a7dd27eb5cd96993fa6856203610a13f96e')

build() {
    jdk="$(find /usr/lib/jvm -maxdepth 1 -name "*11*jdk" | head -1)" &&
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

