# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi
pkgver=0.1.24
pkgrel=1
_ryu_commit=8e58402ca25703730cb6985e2437ac3c8fad071f
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/archive/refs/tags/v$pkgver.tar.gz"
        "ryu-$_ryu_commit.tar.gz::https://github.com/Happilli/ryu/archive/$_ryu_commit.tar.gz")
sha256sums=('5fad24f4082456a7d57442fd60795454f50e989e8c3af166c0645820e216a486'
            'd7d36ef1c45bdb14a66f5ee0a86ae3fb94f30cbf243fc9a8ef7b9ec81ba78731')

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
