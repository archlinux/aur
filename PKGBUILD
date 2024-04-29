# Maintainer: Eric Semeniuc <eric.semeniuc@gmail.com>
pkgname=avro-tools
pkgver=1.11.3
pkgrel=1
pkgdesc='Avro command line tools and utilities'
arch=('any')
url='https://avro.apache.org/'
license=('Apache')
depends=('java-runtime>=8' 'sh')
source=("https://dlcdn.apache.org/avro/avro-${pkgver}/java/avro-tools-${pkgver}.jar")
provides=('avro-tools')
noextract=("avro-tools-${pkgver}.jar")
sha512sums=("276303cf8a287c777b6af6ee454b0b832db421c3b8d64113c9e2ba390ae8171478711d417e9752920d6cf206c105b1aa29807a8c2df78e5a56201194f0b7eef1")

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
