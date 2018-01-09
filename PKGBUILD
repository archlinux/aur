# Maintainer: Daniel Cohen <dan@supercore.co.uk>
pkgname=plymouth-kcm
pkgver=5.11.5
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
sha256sums=('14039826af4849a7a9d60fb34d4697c43068af7a17a10f38de3f0f06cbf34e94'
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
