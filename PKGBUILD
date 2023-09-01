# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
pkgname=java-debug
pkgver=0.49.0
pkgrel=1
pkgdesc="The debug server implementation for Java."
arch=(any)
url="https://github.com/microsoft/java-debug"
lisence=('EPL 1.0')

depends=('java-runtime>=17')
makedepends=('java-environment-openjdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/java-debug/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1067cc96c169734873778a3af59e5bb83f2d026dd2fe3200c63e47e479444a70')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	sed -i -e 's#<tycho-version>2.7.3</tycho-version>#<tycho-version>3.0.4</tycho-version>#' pom.xml
	./mvnw clean install
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 "com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-${pkgver}.jar" \
	               "$pkgdir/usr/share/java-debug/com.microsoft.java.debug.plugin.jar"
	install -Dm755 "com.microsoft.java.debug.core/target/com.microsoft.java.debug.core-${pkgver}.jar" \
	               "$pkgdir/usr/share/java-debug/com.microsoft.java.debug.core.jar"
}
