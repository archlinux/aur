# Maintainer: Daniel Cohen <dan@supercore.co.uk>
pkgname=plymouth-kcm
pkgver=5.10.1
pkgrel=1
pkgdesc="A KCM for configuring Plymouth"
arch=('any')
url="https://cgit.kde.org/plymouth-kcm.git/"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kconfig' 'kconfigwidgets' 'ki18n' 'kdeclarative')
makedepends=('cmake' 'kdoctools' 'extra-cmake-modules')
optdepends=()
options=()
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz")
sha256sums=('7a9ab26f031ee0fdae3d851cb98b6e2f376584e62136c6d936cde930d06c88d3')

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
