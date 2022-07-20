# Maintainer: Campbell Jones <dev at serebit dot com>

pkgbase=wraith-master
pkgname=("wraith-master-common" "wraith-master-cli" "wraith-master-gtk")
pkgver=1.2.1
pkgrel=2
pkgdesc="A Wraith Prism RGB control application"
arch=("x86_64")
url="https://gitlab.com/serebit/wraith-master"
license=("APACHE")
makedepends=("gradle" "scdoc" "libusb" "gtk3")
source=("https://gitlab.com/serebit/$pkgbase/-/archive/v$pkgver/$pkgbase-v$pkgver.tar.gz")
sha256sums=("SKIP")

build() {
    cd "$pkgbase-v$pkgver"
    export GRADLE_USER_HOME=$PWD/.gradle
    export KONAN_DATA_DIR=$PWD/.konan
    make common cli gtk GRADLE=gradle
}

package_wraith-master-common() {
    pkgdesc="Udev rules for wraith-master frontends"

    cd "$pkgbase-v$pkgver"
    make install-common DESTDIR="$pkgdir" PREFIX=/usr
}

package_wraith-master-cli() {
    pkgdesc="Command-line application for controlling RGB on the Wraith Prism"
	depends=("wraith-master-common" "libusb")

    cd "$pkgbase-v$pkgver"
    make install-cli DESTDIR="$pkgdir" PREFIX=/usr
}

package_wraith-master-gtk() {
    pkgdesc="Native Linux GUI for controlling RGB on the Wraith Prism"
    depends=("wraith-master-common" "libusb" "gtk3")

    cd "$pkgbase-v$pkgver"
    make install-gtk DESTDIR="$pkgdir" PREFIX=/usr
}
