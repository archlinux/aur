# Maintainer: Daniel Cohen <dan@supercore.co.uk>
pkgname=plymouth-kcm
pkgver=5.11.3
pkgrel=1
pkgdesc="A KCM for configuring Plymouth"
arch=('any')
url="https://cgit.kde.org/plymouth-kcm.git/"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kconfig' 'kconfigwidgets' 'ki18n' 'kdeclarative')
makedepends=('cmake' 'kdoctools' 'extra-cmake-modules')
optdepends=()
options=()
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('0638236057a5c18587c067ab6784e7a46d04b32e283faafab78c0a40e2e67de9'
'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E')

prepare() {
    mkdir -p $srcdir/${pkgname}-$pkgver/build
}

build() {
	cd "$srcdir/${pkgname}-$pkgver/build"
	cmake .. -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
             -DCMAKE_BUILD_TYPE=Release \
             -DBUILD_TESTING=OFF
	make
}

package() {
	cd "$srcdir/${pkgname}-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
