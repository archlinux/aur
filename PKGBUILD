# Maintainer: Qehbr <qehbr@yahoo.com>
pkgname=m913-ctl
pkgver=1.0.9
pkgrel=1
pkgdesc='Linux configuration tool for the Redragon M913 Impact Elite wireless mouse'
arch=('x86_64')
url='https://github.com/Qehbr/m913-ctl'
license=('GPL-3.0-only')
depends=('libusb')
makedepends=('cmake')
install=m913-ctl.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ce14679eb45a6c1a870fd728bb0c562b78964f4b67897045738b919aaa31d54d')

build() {
    # Wipe any cache left by a previous version's build; reusing $srcdir
    # otherwise fails with "does not match the source used to generate cache".
    rm -rf build
    # No .git in a release tarball, so pass the version in explicitly --
    # without this the binary reports "dev" instead of $pkgver.
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DAPP_VERSION="$pkgver"
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
