# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019')
conflicts=('ezp2019-git')
pkgver=1.0.3
pkgrel=2
provides=('ezp2019' 'libezp2019.so')
options=(!debug)
pkgdesc='USB SPI Flash Programmer'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/ezp2019'
license=('MIT')
makedepends=('cmake' 'gcc' 'python' 'git')
depends=('glibc' 'libusb')
install=ezp2019.install

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'ade4538fc7d0a22ad52e53c2699b7708b89ae2afa6907186a800357df09d2e780bf56f9b0a44c201fbedc5d6f2e914e0397c4b522cb6013144217ebbd3b71de8'
)

build() {
    cmake -DCMAKE_DISABLE_FIND_PACKAGE_Git=ON -DGIT_TAG="v${pkgver}" -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -B"build" "$srcdir/ezp2019-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/ezp2019-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/ezp2019-$pkgver/99-ezp2019.rules" "$pkgdir/usr/lib/udev/rules.d/99-ezp2019.rules"
}
