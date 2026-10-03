# Maintainer: Qehbr <qehbr@yahoo.com>
pkgname=m913-ctl
pkgver=1.2.0
pkgrel=1
pkgdesc='Linux configuration tool for the Redragon M913 Impact Elite wireless mouse'
arch=('x86_64')
url='https://github.com/Qehbr/m913-ctl'
license=('GPL-3.0-only')
depends=('libusb')
makedepends=('cmake')
install=m913-ctl.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5c0a82a75c5e2558b8cfa033eca590f9b827708a60d8eb640ddf2318ef6f41c2')

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
