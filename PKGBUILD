# Maintainer: safalski <https://git.safallama.com.np/safalski>
pkgname=typeshi
pkgver=0.1.22
pkgrel=1
_ryu_commit=200007fb1be91a9a3eb4cc642733865d3f74f447
pkgdesc="A typing application"
arch=('x86_64')
url="https://github.com/RyuZinOh/typeshi-mirror"
license=('BSD-2-Clause')
depends=('qt6-base' 'qt6-declarative' 'qt6-svg' 'qt6-shadertools')
makedepends=('cmake' 'ninja' 'qt6-tools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/RyuZinOh/typeshi-mirror/archive/refs/tags/v$pkgver.tar.gz"
        "ryu-$_ryu_commit.tar.gz::https://github.com/Happilli/ryu/archive/$_ryu_commit.tar.gz")
sha256sums=('7f9c87424adba20f4ab6a623b3194dafb3bd57cc5cf79ca0ede1b65a1a33b27d'
            'f2a61e2899c966488cf35409faeefd293271e6f694825ad710d61c402c7b29c2')

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
