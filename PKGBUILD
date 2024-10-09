# Maintainer: Eric Semeniuc <eric.semeniuc@gmail.com>
pkgname=avro-tools
pkgver=1.12.0
pkgrel=1
pkgdesc='Avro command line tools and utilities'
arch=('any')
url='https://avro.apache.org/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://dlcdn.apache.org/avro/avro-${pkgver}/java/avro-tools-${pkgver}.jar")
provides=('avro-tools')
noextract=("avro-tools-${pkgver}.jar")
sha512sums=("f626d59b91d8a7e7d75ba39818e84e7734775e87ddc2c58b1608b2850453e4a5e921afa228bae69dfb2e0a52466365926425d4b057a61415faae7318fe3c41cf")

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
