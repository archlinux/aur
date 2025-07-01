# Maintainer: Timur Bagautdinov <mr.bagautdinov14 at gmail dot com>
# Maintainer: José Rebelo <joserebelo at outlook dot com>

pkgname=surgescript
pkgver=0.6.1
pkgrel=2
pkgdesc='SurgeScript is a scripting language for games.'
arch=('i686' 'x86_64' 'pentium4' 'arm' 'armv6h' 'armv7h' 'aarch64')
url='https://github.com/alemart/surgescript'
license=('Apache-2.0')
depends=('glibc')
makedepends=('cmake')
options=('staticlibs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('664151bb8c3d66de370ea6c2ae55f271d715f2c4b24bcc5758eb1ba33ed3a691')

build() {
    cd $pkgname-$pkgver

    mkdir -p build

    # https://archlinux.org/todo/lto-fat-objects/
    CFLAGS+=" -ffat-lto-objects"
    CXXFLAGS+=" -ffat-lto-objects"

    cmake -DCMAKE_BUILD_TYPE="Release" \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -S . -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=4.0

    cmake --build build
}

package() {
    cd $pkgname-$pkgver

    DESTDIR="$pkgdir" cmake --install build
}
