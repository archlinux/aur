# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-peripheral-joystick
pkgver=20.1.15
_codename=Nexus
pkgrel=1
pkgdesc="This add-on provides joystick drivers and button mapping services for Kodi. It uses the Peripheral API added to Kodi as part of PR 8807"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/xbmc/peripheral.joystick"
license=('GPL2')
groups=('kodi-addons' 'kodi-peripheral')
makedepends=('cmake' 'kodi-dev' 'tinyxml')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xbmc/peripheral.joystick/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('68825aebe6c458ebe1b3d361295f49c1fe3ec585ab26e8d9010109b12e33421a6a0cf6fc1351b5f07483e6537ab9bec64d09ed658724206bc4ddfd225fbebad4')

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
    depends=('kodi' 'tinyxml')
    cd "peripheral.joystick-$pkgver-$_codename"
    make DESTDIR="$pkgdir/" install
}
