# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019')
conflicts=('ezp2019-git')
pkgver=1.0.1
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
    'c92f3eb179e947470e6e2d8c07c2d7fa6c9f9591b5430a69010292a1cddd698349e306e5c20a0455c0707381bbec4ffda401903d7d0bed2df65ef98dbaf4bb92'
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
