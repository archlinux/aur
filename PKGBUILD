# Maintainer: Ricardo Grim Cabrita <grimkriegor@krutt.org>

pkgname=java-language-server
pkgver=0.2.13
_commit=e747b6bce6740066755e3fa6fa12eb9c7263660c
pkgrel=1
pkgdesc="Java language server using the Java compiler API"
arch=(any)
url="https://github.com/georgewfraser/java-language-server.git"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'maven')
source=("${pkgname}::git+https://github.com/georgewfraser/java-language-server.git#commit=$_commit"
        "launcher.sh")
sha256sums=('SKIP'
            '84920dd2311a6e4b03ef5b853d8acdea8c2119f849fb11b5a77e2d97fcf29d6b')

build() {
    cd "${srcdir}/${pkgname}"

    # Temporary hack allowing us to link stable version 0.2.13, fixed in master
    export JAVA_HOME="/usr/lib/jvm/default"
    sed -i '/^JAVA_HOME=.*$/d' ./scripts/link_mac.sh ./scripts/patch_gson.sh

    ./scripts/link_mac.sh
}

package() {
    mkdir -p \
      "${pkgdir}/usr/share/java" \
      "${pkgdir}/usr/bin"
    cp -r \
      "${srcdir}/${pkgname}/dist/mac" \
      "${pkgdir}/usr/share/java/java-language-server"
    install \
      "${srcdir}/launcher.sh" \
      "${pkgdir}/usr/bin/java-language-server"
}
