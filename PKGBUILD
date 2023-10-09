# Maintainer: Vitalij Berdinskih <vitalij_r2 at outlook dot com>
# Contributor: Peter Vasil <mail at petervasil dot net>
pkgname=h2
pkgver=2.2.224
_releasever=2023-09-17
pkgrel=1
pkgdesc="Java SQL database engine."
arch=('any')
url="http://www.h2database.com"
license=(MPL EPL)
depends=('java-runtime>=7' 'bash')
source=("https://github.com/h2database/h2database/releases/download/version-${pkgver}/h2-${_releasever}.zip")

build() {
	msg2 "Generate executable script..."
	cat > ${pkgname}-console.sh << EOF
#!/bin/sh
/usr/bin/java -cp "/usr/share/java/$pkgname/$pkgname.jar:\$H2DRIVERS:\$CLASSPATH" org.h2.tools.Console "\$@"
EOF
}

package() {
	msg2 "Install Java libraries in /usr/share/java/${pkgname}..."
	install -d "$pkgdir"/usr/share/java/${pkgname}
	install -m644 ${pkgname}/bin/${pkgname}-${pkgver}.jar "$pkgdir"/usr/share/java/${pkgname}/${pkgname}.jar

	msg2 "Install an executable at /usr/bin/..."
	install -Dm755 ${pkgname}-console.sh "$pkgdir"/usr/bin/${pkgname}-console

	msg2 "Install documentation resources in /usr/share/doc/${pkgname}..."
	install -dm755 "$pkgdir"/usr/share/doc/${pkgname}
	cp -a ${pkgname}/docs/* "$pkgdir"/usr/share/doc/${pkgname}
}

md5sums=('5a310fb5a1c3a5d191121b747d2129df')
sha256sums=('33f6c5c51aef2d9b15635214e4c7f01f82256f37df511b3efee3f6b6d79d5deb')
