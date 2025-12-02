# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds' 'python-cfrds')
pkgver='0.9.7'
pkgrel=1
options=(!debug)
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc' 'pkgconf')
depends=('glibc' 'gcc-libs' 'libxml2')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    'd0ef378254e44e24b4150c8eb987c8934973ec9ae5f687115f90ce4cad4bc71d0c35ec5eadaff4dd7611f2d373aa7e49082904ed7132d07c795e6d639587dd52'
)

build() {
    cmake "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B"$pkgname-$pkgver/build" -G Ninja
    cmake --build "$pkgname-$pkgver/build"
}

package_cfrds() {
    cmake --install "$srcdir/$pkgname-$pkgver/build"
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
    install -Dm644 "$srcdir/$pkgname-$pkgver/pkgconfig/cfrds.pc" "$pkgdir/usr/lib/pkgconfig/cfrds.pc"
}

package_python-cfrds() {
    cp -r "$srcdir/cfrds-$pkgver/bin/usr" "$pkgdir/usr"
    install -Dm644 "$srcdir/cfrds-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
