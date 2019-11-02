# Maintainer: Bruce Zhang
pkgname=qt-scrcpy
_name=QtScrcpy
pkgver=1.0.3
pkgrel=2
pkgdesc="Android real-time screencast control tool"
arch=('x86_64')
url="https://github.com/barry-ran/QtScrcpy"
license=('Apache')
depends=('qt5-base')
provides=('qt-scrcpy')
source=(
	"$pkgname-$pkgver.src.tar.gz::https://github.com/barry-ran/$_name/archive/v$pkgver.tar.gz"
	binaries.patch
)
sha256sums=('84c02a9402d7cbaf9626e625ccdde09de6f1d8bd6c02b66995650b312e537adc'
            'd6aaff9b94d2a14f2c27296d30cabbaa70e47bb7fbc2782ce9e754738c748ded')

prepare() {
	cd "$srcdir/$_name-$pkgver/$_name"
	patch < "$srcdir/binaries.patch"
}

build() {
	cd "$srcdir/$_name-$pkgver"
	mkdir build
	cd build
	qmake ../all.pro CONFIG+=qtquickcompiler
	make
}

package() {
	cd "$srcdir/$_name-$pkgver/output/linux/release"
	install -Dm755 QtScrcpy "$pkgdir/usr/bin/QtScrcpy"

	cd "$srcdir/$_name-$pkgver/third_party"
	install -Dm644 scrcpy-server.jar "$pkgdir/usr/share/qt-scrcpy/scrcpy-server.jar"
}
