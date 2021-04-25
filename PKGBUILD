# Maintainer: Campbell Jones <dev at serebit dot com>

pkgbase=wraith-master
pkgname=("wraith-master-common" "wraith-master-cli" "wraith-master-gtk")
pkgver=1.1.2
pkgrel=2
pkgdesc="A Wraith Prism RGB control application built with Kotlin/Native"
arch=("x86_64")
url="https://gitlab.com/serebit/${pkgbase}"
license=("Apache-2.0")
depends=()
makedepends=("gradle" "ncurses5-compat-libs")
source=("${pkgbase}-v${pkgver}::git+https://gitlab.com/serebit/${pkgbase}#tag=v${pkgver}")
sha256sums=("SKIP")

package_wraith-master-common() {
	pkgdesc="Version information and udev rules for wraith-master frontends"

	cd ${pkgbase}-v${pkgver}
	export GRADLE_USER_HOME=$PWD/.gradle
	export KONAN_DATA_DIR=$PWD/.konan
	gradle :core:install -Ppackageroot=${pkgdir} --no-daemon
}

package_wraith-master-cli() {
	pkgdesc="Command-line application for controlling RGB on the Wraith Prism"
	depends=("wraith-master-common" "libusb")

	cd ${pkgbase}-v${pkgver}
	export GRADLE_USER_HOME=$PWD/.gradle
	export KONAN_DATA_DIR=$PWD/.konan
	gradle :cli:install -x :core:install -Ppackageroot=${pkgdir} --no-daemon
}

package_wraith-master-gtk() {
	pkgdesc="Native Linux GUI for controlling RGB on the Wraith Prism"
	depends=("wraith-master-common" "libusb" "gtk3")

	cd ${pkgbase}-v${pkgver}
	export GRADLE_USER_HOME=$PWD/.gradle
	export KONAN_DATA_DIR=$PWD/.konan
	gradle :gtk:install -x :core:install -Ppackageroot=${pkgdir} --no-daemon
}
