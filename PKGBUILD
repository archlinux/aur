# Maintainer: Meredith Oleander <mereditholeander@gmail.com>
pkgname=lexurgy
pkgver=1.1.4
pkgrel=1
pkgdesc="Simulates historical changes in spoken languages by applying regular rules to a list of words"
arch=('any')
url="https://github.com/def-gthill/lexurgy"
license=('GPL3')
depends=("java-runtime" "bash")
source=("https://github.com/def-gthill/lexurgy/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar")
sha256sums=('a10ccfec3c5c4762efd7978309785328a5aa1408c90c5d44274c3e73403d34d5')

prepare() {
    cd "$pkgname-$pkgver"
    sed -i '/^APP_HOME=*/c\APP_HOME=/usr/share/java/lexurgy' bin/lexurgy
    sed -i '/^CLASSPATH=*/c\CLASSPATH=$APP_HOME/lexurgy-1.1.4.jar:$APP_HOME/clikt-jvm-2.7.0.jar:$APP_HOME/kotlin-stdlib-jdk8-1.5.0.jar:$APP_HOME/kotlin-stdlib-jdk7-1.5.0.jar:$APP_HOME/kotlin-stdlib-1.5.0.jar:$APP_HOME/kotlin-stdlib-common-1.5.0.jar:$APP_HOME/antlr4-runtime-4.7.2.jar:$APP_HOME/jna-platform-5.5.0.jar:$APP_HOME/jna-5.5.0.jar:$APP_HOME/annotations-13.0.jar' bin/lexurgy
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/java/lexurgy" \
    lib/annotations-13.0.jar \
    lib/antlr4-runtime-4.7.2.jar \
    lib/clikt-jvm-2.7.0.jar \
    lib/jna-5.5.0.jar \
    lib/jna-platform-5.5.0.jar \
    lib/kotlin-stdlib-1.5.0.jar \
    lib/kotlin-stdlib-common-1.5.0.jar \
    lib/kotlin-stdlib-jdk7-1.5.0.jar \
    lib/kotlin-stdlib-jdk8-1.5.0.jar \
    lib/lexurgy-1.1.4.jar
    install -Dm755 bin/lexurgy "$pkgdir/usr/bin/lexurgy"
}
