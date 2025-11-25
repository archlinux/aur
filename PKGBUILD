# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=('cfrds' 'python-cfrds')
pkgver='0.9.6'
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
    'cdd6bbab451c6ad1a624e7d63a3c3f5b2af569c3d6f373da8e678b1f1670976432868a109ac8daecf87bfc6d506dacc653e39c1dfbbb8138fb278a3fadb503c8'
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
