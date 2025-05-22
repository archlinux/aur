# Maintainer: Omar Pakker <archlinux@opakker.nl>

pkgname=rsa-tokenconverter
pkgver=3.1.0
pkgrel=4
pkgdesc="Converts an RSA SecurID software token into a CTF URL or a QR Code."
arch=('any')
url="https://community.rsa.com/s/article/RSA-SecurID-Software-Token-Converter-3-1-Downloads"
license=('APACHE')
depends=('bash' 'java-runtime')
source=("${pkgname}-${pkgver}.zip::https://rsasecurity.my.salesforce.com/sfc/dist/version/download/?oid=00D70000000IwPy&ids=0684u00000dLhcuAAC&d=/a/4u000001VZmA/hsX4xKY5COHVRYTakz3xOhzidAxid7qIfx8688ujFwU&operationContext=DELIVERY&viewId=05HPO000009aGx82AE&dpt="
        "${pkgname}-${pkgver}-admin.pdf::https://rsasecurity.my.salesforce.com/sfc/dist/version/download/?oid=00D70000000IwPy&ids=0684u00000dLz0TAAS&d=/a/4u000001VZrZ/qELKQxEoKMBX8WLsHrDAqBhBQOVgLMU8KYNilTcMWvA&operationContext=DELIVERY&viewId=05HPO000009aJer2AE&dpt=")
sha1sums=('0dc18d7ef715c293b008c37f6f6808944b6d2db3'
          '04d2608ffd419c91728a1a51e64bb8d5460d02bb')
sha256sums=('b167293fce913c7304da94ccf4580565ad96376d209fce830c7da854011866d9'
            '39499e01ca117bf57b753f3ce509db00cbfa298dcb82de86a6dd7d107158617e')

prepare() {
	{
		echo '#!/usr/bin/env sh'
		echo 'exec java -jar /usr/share/'"${pkgname}"'/TokenConverter.jar "${@}"'
	} > "${pkgname}"
}

package() {
	install -Dm644 "${pkgname}-${pkgver}-admin.pdf" "${pkgdir}/usr/share/doc/${pkgname}/manual.pdf"

	install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" \
		zxing-core-2.1.jar \
		TokenConverter.jar

	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
