# Maintainer: Victor Tran <vicr12345 at gmail dot com>
pkgname=('thefrisbee' 'libthefrisbee')
pkgver=1.0
pkgrel=0
pkgdesc="Disk Management"
arch=("x86_64")
url="https://github.com/vicr123/thefrisbee"
license=('GPL3')
makedepends=('qt5-tools' 'the-libs')
source=("$pkgname-$pkgver"::"https://github.com/vicr123/theFrisbee/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('a1b2dc15bcb2db0851ac7a79ba424e717ca890314c2b42027fbe3e4a9a71637e')

doInstallModule() {
    pushd "theFrisbee-$pkgver/build/$1"
    make install INSTALL_ROOT=$pkgdir
    popd
}

build() {
	cd "theFrisbee-$pkgver"
	mkdir -p build
	cd build
	qmake ../theFrisbee.pro
	make
}

package_thefrisbee() {
    depends=('xdg-utils' 'qt5-base' 'the-libs' 'libthefrisbee')
    
    doInstallModule 'application'
}

package_libthefrisbee() {
    depends=('qt5-base' 'the-libs')
    
    doInstallModule 'libthefrisbee'
}
