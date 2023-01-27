# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.6.0'
pkgrel=2
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc')
depends=('glibc')

build() {
    wget https://github.com/bokic/$pkgname/archive/refs/tags/$pkgver.tar.gz
    tar xvzf $pkgver.tar.gz

    cmake $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B$pkgname-$pkgver/build -G Ninja
    ninja -C$pkgname-$pkgver/build
}

package() {
    ninja -C"$srcdir"/$pkgname-$pkgver/build install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
