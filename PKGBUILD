# Maintainer: Noah Vogt <noah@noahvogt.com>
pkgname=tibasicc
pkgver=1.2
pkgrel=2
pkgdesc="TI-BASIC (de-)compiler written in C++ with a decent preprocessor"
arch=('x86_64' 'aarch64')
url="https://github.com/noahvogt/tibasicc"
license=('ISC')
depends=('gcc-libs' 'glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6eab541b7e31749d2406fff0f16c28fe503695540cb8296c3574f4c23c9e8aae')

build() {
    cd "$pkgname-$pkgver"
    # the link step ignores LDFLAGS, so pass them along with CXX
    make CXX="${CXX:-g++}" CXXFLAGS="$CXXFLAGS $LDFLAGS"
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 tibasicc "$pkgdir/usr/bin/tibasicc"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    cp -r doc/tixx_guide/linkguide "$pkgdir/usr/share/doc/$pkgname/"
}
