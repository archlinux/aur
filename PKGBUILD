# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-peripheral-joystick
pkgver=20.1.7
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
sha512sums=('f60e8ede9344b5172fc9882f535bbaad2c1e6d187c97c20b07fb601738676da7db4e15df9c1fc3d437aa6edb271185771e321955829503a9824d5eeb96a2ec9b')

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
