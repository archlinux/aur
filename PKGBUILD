# Maintainer: NexAdn
pkgname=obs-linuxbrowser
pkgver=0.1.2
pkgrel=2
pkgdesc="Browser source plugin for obs-studio based on CEF. Alternative to obs-qtwebkit."
arch=("i686" "x86_64")
url="https://github.com/bazukas/obs-linuxbrowser"
license=("GPL")
depends=(
	"obs-studio>=18.0.1" "cef-minimal"
)
makedepends=("make" "cmake" "git")
source=(
    "https://github.com/bazukas/$pkgname/archive/${pkgver}.tar.gz"
)
sha256sums=(
    "2867ca780cab34a1a9396394c079854cb363a3e9a154e96948e272f096460514"
)
build() {
    cd "$srcdir"/${pkgname}-${pkgver}
    mkdir -p ./build
    cd ./build
    cmake -D CEF_DIR="/opt/cef-minimal" ..
    make clean
    make -j4
}
package() {
    mkdir -p "$pkgdir"/usr/lib/obs-plugins/
	mkdir -p "$pkgdir"/usr/share/obs/obs-plugins/$pkgname
	cp -R "$srcdir"/$pkgname-${pkgver}/build/build/$pkgname/bin/64bit/* "$pkgdir"/usr/lib/obs-plugins/
	mv "$pkgdir"/usr/lib/obs-plugins/libobs-linuxbrowser.so "$pkgdir"/usr/lib/obs-plugins/obs-linuxbrowser.so
	cp -R "$srcdir"/$pkgname-$pkgver/build/build/$pkgname/data/* "$pkgdir"/usr/share/obs/obs-plugins/$pkgname
}
