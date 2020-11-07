# Maintainer: Witalij Berdinskich <radio_rogal at keemail dot me>
pkgname=coap-shell
pkgver=1.1.1
pkgrel=1
pkgdesc='An interactive, command line interface for interacting with CoAP enabled servers'
arch=('any')
url='https://github.com/tzolov/coap-shell'
license=('Apache')
depends=('java-runtime>=8' 'bash')
source=(${pkgname}-${pkgver}.jar::https://bintray.com/big-data/maven/download_file?file_path=io%2Fdatalake%2Fcoap%2F${pkgname}%2F1.1.1%2F${pkgname}-${pkgver}.jar)
noextract=(${pkgname}-${pkgver}.jar)
md5sums=('8cd6d0bc0e2836ff769a372c4752d008')
sha256sums=('608efa216888256ad58e92a72da478ea5e46b82c9e95cd3e3eff9a2f2a153dd6')

build() {
	cd "$srcdir"

	cat > ${pkgname} << EOF
#!/bin/sh
/usr/bin/java -jar /usr/share/$pkgname/${pkgname}-${pkgver}.jar
EOF
}

package() {
	install -d "$pkgdir"/usr/share/$pkgname
	install -m 644 "$srcdir"/${pkgname}-${pkgver}.jar "$pkgdir"/usr/share/$pkgname
	
	install -d "$pkgdir"/usr/bin
	install -m 755 "$srcdir"/$pkgname "$pkgdir"/usr/bin
}
