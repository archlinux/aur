# Maintainer: Ricardo Grim Cabrita <grim@kriegor.net>

pkgname=kotlin-language-server
pkgver=1.3.9
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
sha256sums=('4c06ce35b1686c27cc4a8b8dc0905dd3901e83de7028e0c7c0cfd2b6082e1e09')

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

