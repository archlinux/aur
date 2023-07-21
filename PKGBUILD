# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-peripheral-joystick
pkgver=20.1.10
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides joystick drivers and button mapping services for Kodi. It uses the Peripheral API added to Kodi as part of PR 8807"
arch=('armv7h' 'aarch64')
url="https://github.com/xbmc/peripheral.joystick"
license=('GPL2')
groups=('kodi-addons' 'kodi-peripheral')
makedepends=('cmake' 'kodi-dev' 'tinyxml')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xbmc/peripheral.joystick/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('c4b839275807dda90520c30cc970e6876cbddd0c334b65a3cc452def975bb046af19bffa0e042d0467a2b898a9c0344efaeaa4d5b82f931e61b54e770eaa932a')

build() {
    cd "peripheral.joystick-$pkgver-$_codename"
    cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DBUILD_SHARED_LIBS=1 \
        -DUSE_LTO=1 \
        .
    make
}

package() {
    depends=('kodi-rpi' 'tinyxml')
    cd "peripheral.joystick-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
