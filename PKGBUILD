# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019')
conflicts=('ezp2019-git')
pkgver=1.0.4
pkgrel=1
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
    '25c58a6d193de21fbb59c78c6b93f508a098132d9f943c32c689c5da994e8843c017021cca0ed2d637818c5c605ef5c13bc79a23591b1aac2a272799e8ba5674'
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
