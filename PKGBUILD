# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thefile' 'libthefile')
pkgver=5.0
pkgrel=1
pkgdesc="File Manager"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thefile"
license=('GPL3')
makedepends=('git' 'qt6-tools' 'cmake' 'clang' 'quazip-qt6' 'libimobiledevice' 'libtdesktopenvironment' 'libthefrisbee')
source=("thefile-$pkgver"::"https://github.com/theCheeseboard/thefile/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0a84231b8d85ee22f0bd2989ee290917bd3003b50d70558249e1838ce4cfd4a0')

doInstallModule() {
	DESTDIR="$pkgdir" cmake --install "build/$1"
}

build() {
	cmake -B build -S "thefile-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package_thefile() {
    depends=('libimobiledevice' 'quazip-qt6' 'libthefile')

    doInstallModule 'application'
    doInstallModule 'plugins'
}

package_libthefile() {
    depends=('libtdesktopenvironment' 'libthefrisbee')

    doInstallModule 'libthefile'
}
