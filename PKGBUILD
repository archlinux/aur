# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('ezp2019-git')
conflicts=('ezp2019')
pkgver=0.9.0.r5.gb8768dd
pkgrel=1
provides=('ezp2019' 'libezp2019.so')
options=(!debug)
pkgdesc='EZP2019 USB SPI Flash Programmer'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/ezp2019'
license=('MIT')
makedepends=('cmake' 'gcc' 'python' 'git')
depends=('glibc' 'libusb')
install=ezp2019.install

source=(
    'ezp2019::git+https://github.com/bokic/ezp2019.git'
)

sha512sums=(
    'SKIP'
)

pkgver() {
    cd "ezp2019"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -DCMAKE_INSTALL_PREFIX="/usr" -DCMAKE_BUILD_TYPE=Release -B"build" "$srcdir/ezp2019"
    cmake --build "build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "build"
    install -Dm644 "$srcdir/ezp2019/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/ezp2019/99-ezp2019.rules" "$pkgdir/usr/lib/udev/rules.d/99-ezp2019.rules"
}
