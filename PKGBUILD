# Maintainer: b1f6c1c4 <b1f6c1c4@gmail.com>
pkgname=ajnin
pkgver=0.3
pkgrel=1
pkgdesc='A Beautiful Ninja generator'
arch=('any')
url='https://github.com/b1f6c1c4/ajnin'
license=('AGPL3')
depends=('boost>=1.75.0' 'ninja')
makedepends=('antlr4>=4.9.3' 'cmake>=3.17' 'git' 'pandoc')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b4a4507cadc20bb89c538871b7dc6e2ce245b183343b982a441133e068972d9d')

build() {
    cmake -S "$pkgname-$pkgver" -B "$pkgname-$pkgver/build" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
    make -C "$pkgname-$pkgver/build"
    echo /runtime/Cpp/runtime/thirdparty/utfcpp/ >>"$pkgname-$pkgver/build/antlr4_runtime/src/antlr4_runtime/.git/info/exclude"
    make -C "$pkgname-$pkgver/build" manual
}

check() {
    make -C "$pkgname-$pkgver/build" test
}

package() {
    cd "$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install
}
