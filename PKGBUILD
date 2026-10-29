# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi
pkgver=0.1.20
pkgrel=1
_ryu_commit=6ceb2317119cbc4a48f66479f14fc909e1345ff9
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/archive/refs/tags/v$pkgver.tar.gz"
        "ryu-$_ryu_commit.tar.gz::https://github.com/Happilli/ryu/archive/$_ryu_commit.tar.gz")
sha256sums=('8ad6e054a70cb0f343e3abab6e9ce750047a08c345399aa642cd4c69361aa6b1'
            '6f55b4362aa6d9f677fbdc8903455270c6f53b5bd885922ada6d4a8f5d1239ce')

prepare() {
  cp -a "$srcdir/ryu-$_ryu_commit/." "$srcdir/typeshi-mirror-$pkgver/third_party/ryu/"
}

build() {
  cmake -B build -S "typeshi-mirror-$pkgver" -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -G Ninja
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
  install -Dm644 "typeshi-mirror-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
