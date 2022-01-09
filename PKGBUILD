# Maintainer: Campbell Jones <dev at serebit dot com>

pkgbase=wraith-master
pkgname=("wraith-master-common" "wraith-master-cli" "wraith-master-gtk")
pkgver=1.2.1
pkgrel=1
pkgdesc="A Wraith Prism RGB control application built with Kotlin/Native"
arch=("x86_64")
url="https://gitlab.com/serebit/${pkgbase}"
license=("Apache-2.0")
depends=()
makedepends=("gradle" "scdoc")
source=("${pkgbase}-v${pkgver}::git+https://gitlab.com/serebit/${pkgbase}#tag=v${pkgver}")
sha256sums=("SKIP")

package_wraith-master-common() {
	pkgdesc="Udev rules for wraith-master frontends"

	cd ${pkgbase}-v${pkgver}
	make common
	make install-common DESTDIR=${pkgdir} PREFIX=/usr
}

package_wraith-master-cli() {
	pkgdesc="Command-line application for controlling RGB on the Wraith Prism"
	depends=("wraith-master-common" "libusb")

	cd ${pkgbase}-v${pkgver}
	export GRADLE_USER_HOME=$PWD/.gradle
	export KONAN_DATA_DIR=$PWD/.konan
	make cli GRADLE=gradle
	make install-cli DESTDIR=${pkgdir} PREFIX=/usr
}

package_wraith-master-gtk() {
	pkgdesc="Native Linux GUI for controlling RGB on the Wraith Prism"
	depends=("wraith-master-common" "libusb" "gtk3")

	cd ${pkgbase}-v${pkgver}
	export GRADLE_USER_HOME=$PWD/.gradle
	export KONAN_DATA_DIR=$PWD/.konan
	make gtk GRADLE=gradle
	make install-gtk DESTDIR=${pkgdir} PREFIX=/usr
}
