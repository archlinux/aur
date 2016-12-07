# Maintainer: Jean-Gabriel Young <info@jgyoung.ca>
pkgname=chomp
pkgver=1.2
pkgrel=1
pkgdesc="Computation Homology Project software"
arch=('i686' 'x86_64')
url="https://github.com/shaunharker/CHomP"
license=('custom:MIT')
depends=('cimg' 'boost>=1.58.0')
makedepends=('cmake')
source=("https://github.com/shaunharker/CHomP/archive/v$pkgver.tar.gz")


prepare () {
        cd "CHomP-$pkgver"
        # Patch paths
        sed -i   -e "s|local/||g" -e 's|${CMAKE_BINARY_DIR}/||g' -e "s|/opt/.*\w||g" CMakeLists.txt
}

build () {
        cd "CHomP-$pkgver"
        cmake -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package() {
	cd "CHomP-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}


md5sums=('6ffeb70f421b37fe771647573e0971dc')
