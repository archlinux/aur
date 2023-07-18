# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thefrisbee' 'libthefrisbee')
pkgver=2.0
pkgrel=1
pkgdesc="Disk Management"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thefrisbee"
license=('GPL3')
makedepends=('git' 'qt6-tools' 'cmake' 'clang' 'libcontemporary')
source=("thefrisbee"::"https://github.com/theCheeseboard/theFrisbee/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a596f17a414de78bbaf5ff6da1f4fa0773e21f4896c59a49c5b65e73c056adb9')

doInstallModule() {
	DESTDIR="$pkgdir" cmake --install "build/$1"
}

build() {
	cmake -B build -S "theFrisbee-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package_thefrisbee() {
    depends=('xdg-utils' 'libcontemporary' 'libthefrisbee')
    
    doInstallModule 'application'
}

package_libthefrisbee() {
    depends=('libcontemporary')
    
    doInstallModule 'libthefrisbee'
}
