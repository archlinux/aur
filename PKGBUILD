# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019')
conflicts=('ezp2019-git')
pkgver=1.0.0
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
    '1348712e615efda531fff93ab1801e90d6391300803cd9580a69b9b05fe6c13cf01cd6a9cec6fcd868ec1bd8c381dfa470e8f2d7cb9174cd95e80c7969c5652a'
)

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -B"build" "$srcdir/ezp2019-$pkgver"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/ezp2019-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/ezp2019-$pkgver/99-ezp2019.rules" "$pkgdir/usr/lib/udev/rules.d/99-ezp2019.rules"
}
