# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019')
conflicts=('ezp2019-git')
pkgver=1.0.2
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
    '627bad76506023ba8806a6a2b8ee351b89539af30f5eb247868020fa5bc85bc989ac4c8bcb28885f7f233e0c099ec17b959b12497b3c04ea0539ab8d3ae412cc'
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
