# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
pkgname=java-debug
pkgver=0.47.0
pkgrel=1
pkgdesc="The debug server implementation for Java."
arch=(any)
url="https://github.com/microsoft/java-debug"
lisence=('EPL 1.0')

depends=('java-runtime>=17')
makedepends=('jdk17-openjdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/java-debug/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7c1cce4ade940f38ef568c630ef079e11928ee72ae1fccb039c26bc22322c206')

build() {
    prev_java_ver=$(archlinux-java get)
    archlinux-java set java-17-openjdk
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./mvnw clean install
    archlinux-java set "$prev_java_ver"
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-${pkgver}.jar" \
                   "$pkgdir/usr/share/java-debug/com.microsoft.java.debug.plugin.jar"
    install -Dm755 "com.microsoft.java.debug.core/target/com.microsoft.java.debug.core-${pkgver}.jar" \
                   "$pkgdir/usr/share/java-debug/com.microsoft.java.debug.core.jar"
}
