# Maintainer: Nguyễn Quang Minh <minhnbnt at gmail dot com>
pkgname=java-debug
pkgver=0.52.0
pkgrel=1
pkgdesc="The debug server implementation for Java."
arch=(any)
url="https://github.com/microsoft/java-debug"
license=('EPL-1.0')

depends=('java-runtime>=17')
makedepends=('java-environment-openjdk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/microsoft/java-debug/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1e9f8e82b2d6d41eb1ee66d34ad1e90e678e1bd34660074784fcefdc2e13e2db')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./mvnw clean install
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.plugin.jar"
	install -Dm755 "com.microsoft.java.debug.core/target/com.microsoft.java.debug.core-${pkgver}.jar" \
		"$pkgdir/usr/share/java-debug/com.microsoft.java.debug.core.jar"

	install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
