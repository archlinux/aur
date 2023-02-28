# Maintainer: Erik Moldtmann <erik@moldtmann.de>
# Contributor: Zack Emmert <zemmert@fastmail.com>
# Contributor: Alexandre Bouvier <contact@amb.tf>
# Contributor: Daniel Cohen <dan@supercore.co.uk>
# Contributor: Jamesjon <universales@protonmail.com>
pkgname=plymouth-kcm
pkgver=5.27.2
pkgrel=1
pkgdesc="KCM to manage the Plymouth (Boot) theme"
arch=('any')
url="https://invent.kde.org/plasma/plymouth-kcm.git"
license=('GPL')
depends=('plymouth' 'knewstuff' 'kconfig' 'kconfigwidgets' 'ki18n' 'kdeclarative' 'kcmutils')
makedepends=('cmake' 'kdoctools' 'extra-cmake-modules')
source=("https://download.kde.org/stable/plasma/$pkgver/$pkgname-$pkgver.tar.xz"{,.sig})
sha256sums=('c6b555fc80af1e5681d4149c899286fb682be15aec26698296a8725c25fa7dda'
            'SKIP')
validpgpkeys=(2D1D5B0588357787DE9EE225EC94D18F7F05997E  # Jonathan Riddell <jr@jriddell.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Riddell <jr@riddell.org>
              0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D) # Bhushan Shah <bshah@kde.org>

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
