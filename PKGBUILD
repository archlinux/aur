# Maintainer: Eric Semeniuc <eric.semeniuc@gmail.com>
pkgname=avro-tools
pkgver=1.11.1
pkgrel=1
pkgdesc='Avro command line tools and utilities'
arch=('any')
url='https://avro.apache.org/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://dlcdn.apache.org/avro/avro-${pkgver}/java/avro-tools-${pkgver}.jar")
provides=('avro-tools')
noextract=("avro-tools-${pkgver}.jar")
sha512sums=("1340183c2fc07071ad81a6b1a9e410d2a4e198dd3756d9d48e8da33280456426cebf3ba8908c197f48ea522dbbf52d4b2d9005d05e4698e7f1109fa0d54b31fb")

build() {
	cd "$srcdir"
	msg2 "Generate executable script..."
	cat > ${pkgname}-launcher.sh << EOF
#!/bin/sh
exec /usr/bin/java -jar '/usr/share/java/${pkgname}/${pkgname}.jar' "\$@"
EOF
}
package() {
	cd "${srcdir}"

	msg2 "Install Java libraries in /usr/share/java/${pkgname}..."
	install -D "avro-tools-${pkgver}.jar" "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

	msg2 "Install an executable at /usr/bin/..."
	install -D ${pkgname}-launcher.sh "${pkgdir}/usr/bin/${pkgname}"
}
