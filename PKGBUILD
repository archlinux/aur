# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Zack Emmert <zemmert@fastmail.com>
# Contributor: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Cohen <dan@supercore.co.uk>
# Contributor: Jamesjon <universales@protonmail.com>
pkgname=plymouth-kcm
pkgver=5.20.1
pkgrel=1
pkgdesc="KCM to manage the Plymouth (Boot) theme"
arch=('any')
url="https://invent.kde.org/plasma/plymouth-kcm.git"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kconfig' 'kconfigwidgets' 'ki18n' 'kdeclarative' 'kcmutils')
makedepends=('cmake' 'kdoctools' 'extra-cmake-modules')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('49cf83e1c4e79088fe930f0d5eed55fab5a7b4ef1fe8700284ff75789d4d5d2c'
            'SKIP')
validpgpkeys=('2D1D5B0588357787DE9EE225EC94D18F7F05997E')

prepare() {
	mkdir -p $srcdir/${pkgname}-$pkgver/build
}

build() {
    cd "$srcdir/${pkgname}-$pkgver/build"
    cmake .. -DCMAKE_INSTALL_PREFIX=`kf5-config --prefix` \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/usr/share/ECM \
    -DBUILD_TESTING=OFF
    make
}

package() {
	cd "$srcdir/${pkgname}-$pkgver/build"
    make DESTDIR="$pkgdir" install
}
