# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=qmk-tools
pkgver=1.3.0
pkgrel=5
pkgdesc='Mikrokopter Tools (like Kopter-Tool)'
arch=('x86_64' 'i686')
url='http://mikrokopter.de/ucwiki/QMK-Tools'
license=('GPL')
depends=('qwt')
source=("QMK-Tools-v${pkgver}.tgz::http://svn.mikrokopter.de/mikrowebsvn/filedetails.php?repname=Projects&path=%2FQMK-Groundstation%2FRelease%2FQMK-Tools-v${pkgver}.tgz")
sha256sums=('ad93051f994f70de1e41b80cc9a280838a4fcd67b7468ecaa7cea8969bf6f451')

build() {
	cd "${srcdir}/QMK-Tools v${pkgver}/"

	sed -i -e 's/-lqwt5*/-lqwt/g' -e 's/\/usr\/include\/qwt5*/\/usr\/include\/qwt/g' QMK-Scope/{Makefile,QMK-Scope.pro}
	sed -i '1i #include <unistd.h>' Global/Class_Input/Input_TCP.cpp

	sh ./build-opensuse.sh
}

package() {
	cd "${srcdir}/QMK-Tools v${pkgver}/"

	install -d ${pkgdir}/usr/bin
	for FILE in Binary/*; do
		install -m0755 ${FILE} ${pkgdir}/usr/bin/
	done
}

