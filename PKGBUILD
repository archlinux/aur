# Maintainer: Vitaliy Berdinskikh <ur6lad at gmail dot com>
# Contributor: Peter Vasil <mail at petervasil dot net>
pkgname=h2
pkgver=1.4.197
_releasever=2018-03-18
pkgrel=1
pkgdesc="Java SQL database engine."
arch=(any)
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=7' 'bash')
source=("http://www.h2database.com/h2-${_releasever}.zip")
sha256sums=('a45e7824b4f54f5d9d65fb89f22e1e75ecadb15ea4dcf8c5d432b80af59ea759')

build() {
	cd "$srcdir"

	msg2 "Generate executable script..."
	cat > ${pkgname}-console.sh << EOF
#!/bin/sh
/usr/bin/java -cp "/usr/share/java/$pkgname/$pkgname.jar:\$H2DRIVERS:\$CLASSPATH" org.h2.tools.Console "\$@"
EOF
}

package() {
	cd "$srcdir"

	msg2 "Install Java libraries in /usr/share/java/${pkgname}..."
	install -d "$pkgdir"/usr/share/java/${pkgname}
	install -m 644 ${pkgname}/bin/${pkgname}-${pkgver}.jar "$pkgdir"/usr/share/java/${pkgname}/${pkgname}.jar

	msg2 "Install an executable at /usr/bin/${pkgname}..."
	install -Dm755 ${pkgname}-console.sh "$pkgdir"/usr/bin/${pkgname}-console

	msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
	install -dm755 "$pkgdir"/usr/share/doc/${pkgname}
	cp -a ${pkgname}/docs/* "$pkgdir"/usr/share/doc/${pkgname}
}
