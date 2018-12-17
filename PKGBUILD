# Maintainer: Daniel Wilhelm <concat(shield, wed) @ outlook.com>

pkgname=wwphone
pkgver=2.3.15
pkgrel=1
pkgdesc="A proprietary CTI and SIP client from wwcom"
arch=('x86_64')
license=('custom:"Copyright (c) 2018 by wwcom ag"')
url="https://www.wwcom.ch/"

source=("https://wwcom.ch/downloads/wwphone_${pkgver//./_}.deb")
sha256sums=('a6e548580485dc61bb4f8b069e2fac87b3ce3e463c3e28cf6e4f50915781ef47')

depends=(
	"alsa-lib"
	"hidapi"
	"libxss"
        "qt5pas"
	)


package() {
	cd "${srcdir}"

	tar -xvf data.tar.xz

	install -d "${pkgdir}"/opt/wwphone/certs
	install -m 0644 opt/wwphone/certs/* "${pkgdir}"/opt/wwphone/certs
	install -m 0644 opt/wwphone/{*.wav,wwphone.png} "${pkgdir}"/opt/wwphone
	install -m 0755 opt/wwphone/wwphone.bin "${pkgdir}"/opt/wwphone/wwphone.bin
	install -d "${pkgdir}"/opt/wwphone/locale
	install -m 0644 opt/wwphone/locale/* "${pkgdir}"/opt/wwphone/locale

	install -Dm 0644 opt/wwphone/license.txt "${pkgdir}"/usr/share/licenses/$pkgname/license.txt
	install -Dm 0755 usr/local/bin/wwphone "${pkgdir}"/usr/bin/wwphone
	install -Dm 0644 usr/share/applications/wwphone.desktop \
	 	"${pkgdir}"/usr/share/applications/wwphone.desktop
	sed -e 's|/usr/local/bin|/usr/bin|' -i "${pkgdir}"/usr/share/applications/wwphone.desktop
	sed -e 's|Exec=/usr/bin/wwphone|Exec=/usr/bin/wwphone %u|' -i "${pkgdir}"/usr/share/applications/wwphone.desktop
	sed -e '$aMimeType=x-scheme-handler/tel;' -i "${pkgdir}"/usr/share/applications/wwphone.desktop
}
