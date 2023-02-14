# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-peripheral-joystick
pkgver=20.1.0
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
sha512sums=('c5016f74bee316e5b25686420125397cb1840de72be4e9a11390a1338ad920b93d2e8cf36e845feb82aba826a425152dcb621a9ef1b6aea6259d9423283957d9')

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
