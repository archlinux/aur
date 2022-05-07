# Maintainer: Eric Semeniuc <eric.semeniuc@gmail.com>
pkgname=avro-tools
pkgver=1.11.0
pkgrel=1
pkgdesc='Avro command line tools and utilities'
arch=('any')
url='https://avro.apache.org/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://dlcdn.apache.org/avro/avro-${pkgver}/java/avro-tools-${pkgver}.jar")
provides=('avro-tools')
noextract=("avro-tools-${pkgver}.jar")
sha256sums=("43ba8e1d63d6273e8ca72fee68b4125bfdbbbb3112ea0b021fa29d0c0d2f2276")

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
