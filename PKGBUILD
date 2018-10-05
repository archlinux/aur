# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=rsa-tokenconverter
pkgver=3.1.0
pkgrel=2
pkgdesc="Converts an RSA SecurID software token into a CTF URL or a QR Code."
arch=('any')
url="https://community.rsa.com/community/products/securid/software-token-converter"
license=('APACHE')
depends=('bash' 'java-environment')
source=("https://community.rsa.com/servlet/JiveServlet/download/62014-4-57430/TokenConverter${pkgver//.}.zip"
        "https://community.rsa.com/servlet/JiveServlet/downloadBody/62012-102-1-67234/token_converter${pkgver//.}_admin.pdf")
sha1sums=('0dc18d7ef715c293b008c37f6f6808944b6d2db3'
          '08881e855dea049c85fcf73426aa3d70d704ce12')
sha256sums=('b167293fce913c7304da94ccf4580565ad96376d209fce830c7da854011866d9'
            '0219aabeaccf0e7a4b4cfea406503649bb39f9b68228eb77c65e6575f9ca46c3')

prepare() {
	{
		echo '#!/usr/bin/bash'
		echo 'java -jar /usr/share/'"${pkgname}"'/TokenConverter.jar "${@}"'
	} > "${pkgname}"
}

package() {
	install -Dm644 "token_converter${pkgver//.}_admin.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"

	install -Dm644 "zxing-core-2.1.jar" "${pkgdir}/usr/share/${pkgname}/zxing-core-2.1.jar"
	install -Dm644 "TokenConverter.jar" "${pkgdir}/usr/share/${pkgname}/TokenConverter.jar"

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
