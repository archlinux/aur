# Maintainer: mcarni <michele DOT carnaghi AT googlemail DOT com>

pkgname=kodi-peripheral-joystick
pkgver=21.1.23
_codename=Omega
pkgrel=1
pkgdesc="This add-on provides joystick drivers and button mapping services for Kodi. It uses the Peripheral API added to Kodi as part of PR 8807"
arch=('armv7h' 'aarch64' 'x86_64')
url="https://github.com/xbmc/peripheral.joystick"
license=('GPL2')
groups=('kodi-addons' 'kodi-peripheral')
makedepends=('cmake' 'kodi-dev' 'tinyxml')
options=(!lto debug)
source=("$pkgname-$pkgver.tar.gz::https://github.com/xbmc/peripheral.joystick/archive/refs/tags/$pkgver-$_codename.tar.gz")
sha512sums=('6c948680ec919076479c47031a75eefd7e6bad7d3f40d8b1a9d38e1f831b136cdab9381fa624e7d0255bd7bc558bf6b34ea4f38021724067059abc7df6917aae')

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
