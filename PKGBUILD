# Maintainer: Campbell Jones <dev at serebit dot com>

pkgbase=wraith-master
pkgname=("wraith-master-cli" "wraith-master-gtk")
pkgver=0.3.1
pkgrel=1
pkgdesc="A Wraith Prism RGB control application built with Kotlin/Native"
arch=("x86_64")
url="https://gitlab.com/serebit/${pkgbase}"
license=("Apache-2.0")
depends=("libusb" "gcc" "glibc")
makedepends=("java-environment=8" "ncurses5-compat-libs")
source=("git+https://gitlab.com/serebit/${pkgbase}#tag=${pkgver}")
sha256sums=("SKIP")

setup() {
	cd ${pkgbase}-${pkgver}
	GRADLE_USER_HOME=.gradle ./gradlew --refresh-dependencies --no-daemon
}

package_wraith-master-cli() {
	cd ${pkgbase}-${pkgver}
	GRADLE_USER_HOME=.gradle KONAN_DATA_DIR=.konan ./gradlew :cli:install -Pinstalldir=${pkgdir}/usr -Pudevdir=${pkgdir}/usr/lib/udev --no-daemon
}

package_wraith-master-gtk() {
	depends=("gtk3" "glib2")

    cd ${pkgbase}-${pkgver}
	GRADLE_USER_HOME=.gradle KONAN_DATA_DIR=.konan ./gradlew :gtk:install -Pinstalldir=${pkgdir}/usr -Pudevdir=${pkgdir}/usr/lib/udev --no-daemon
}
