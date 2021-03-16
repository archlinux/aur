# Maintainer: Campbell Jones <dev at serebit dot com>

pkgbase=wraith-master
pkgname=("wraith-master-cli" "wraith-master-gtk")
pkgver=1.1.2
pkgrel=1
pkgdesc="A Wraith Prism RGB control application built with Kotlin/Native"
arch=("x86_64")
url="https://gitlab.com/serebit/${pkgbase}"
license=("Apache-2.0")
depends=()
makedepends=("gradle" "ncurses5-compat-libs")
source=("${pkgbase}-v${pkgver}::git+https://gitlab.com/serebit/${pkgbase}#tag=v${pkgver}")
sha256sums=("SKIP")

setup() {
	cd ${pkgbase}-v${pkgver}
	GRADLE_USER_HOME=$PWD/.gradle gradle --refresh-dependencies --no-daemon
}

package_wraith-master-cli() {
	cd ${pkgbase}-v${pkgver}
	GRADLE_USER_HOME=$PWD/.gradle KONAN_DATA_DIR=$PWD/.konan gradle :cli:install -Ppackageroot=${pkgdir} --no-daemon
}

package_wraith-master-gtk() {
	depends=("gtk3")

    cd ${pkgbase}-v${pkgver}
	GRADLE_USER_HOME=$PWD/.gradle KONAN_DATA_DIR=$PWD/.konan gradle :gtk:install -Ppackageroot=${pkgdir} --no-daemon
}
