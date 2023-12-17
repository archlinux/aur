# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname='cfrds'
pkgver='0.7.0'
pkgrel=1
pkgdesc='Client side ColdFusion RDS protocol.'
arch=('x86_64' 'i686' 'pentium4' 'armv7h' 'aarch64')
url='https://github.com/bokic/cfrds'
license=('MIT')
makedepends=('cmake' 'ninja' 'gcc')
depends=('glibc')

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/bokic/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
)

sha512sums=(
    '440396d566d65b15926454b9f5f7be310f8a5f66a0fce8a0d07fa0eb871b4b98313d3bd8a43a9cd1438f1b93dd1be909c0b734e2161b5660723a12776f2bc900'
)

build() {
    cmake $pkgname-$pkgver -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" -B$pkgname-$pkgver/build -G Ninja
    ninja -C$pkgname-$pkgver/build
}

package() {
    ninja -C"$srcdir"/$pkgname-$pkgver/build install
    install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/cfrds/LICENSE"
}
