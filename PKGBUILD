# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thefrisbee' 'libthefrisbee')
pkgver=3.0
pkgrel=1
pkgdesc="Disk Management"
arch=("x86_64" "aarch64")
url="https://github.com/theCheeseboard/thefrisbee"
license=('GPL3')
makedepends=('git' 'qt6-tools' 'cmake' 'clang' 'libcontemporary')
source=("thefrisbee-$pkgver"::"https://github.com/theCheeseboard/theFrisbee/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('8ac9b804b513e61ba80b0cc48f8d0c39cd65f97c7da4faf0bb2a70695363a78d')

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
