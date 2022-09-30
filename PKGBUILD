# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=kotlin-language-server
pkgver=1.3.1
pkgrel=2
pkgdesc="Smart code completion, diagnostics and more for Kotlin using the Language Server Protocol"
arch=(any)
url="https://github.com/fwcd/KotlinLanguageServer"
license=('MIT')
conflicts=('kotlin-language-server-git')
provides=('kotlin-language-server')
depends=('java-runtime>=11')
makedepends=('java-environment>=11')
source=("${url}/archive/${pkgver}.tar.gz")
sha256sums=('a968e0079787f1a6d2f46b4dbd49b2394c266287c8573097f71a14cdb794223d')

build() {
    jdk="$(find /usr/lib/jvm -maxdepth 1 -name "*1*jdk" | head -1)" &&
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

