# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds' 'python-cfrds')
pkgver='1.0.0'
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
    '314a5667ac01a8ffe6388c718b3c4d13c0f4a0c2779b5ee2a12af89a021273ab28a2d94cdabb92b1cf8408d41e281c265ca26a0fb2a32950c61406a587f38d64'
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
