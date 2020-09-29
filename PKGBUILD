# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Maxs <max dot van dot den dot branden @t gmail dot com>

pkgname=solarus-quest-editor
pkgver=1.6.4
pkgrel=1
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
license=("GPL" "custom")
depends=("solarus" "qt5-base" "qt5-tools" "glm")
makedepends=("cmake" "zip")
checkdepends=()
source=("https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "qpainter-include.patch")
sha256sums=('741f44c4e04316b67c9ec3fba636526c1013d61b32a23343f8a655e8a50f9ac7'
            '02eb7a944b2161d471a1f14230da9f292cd29a8ac6427d331011b749efe7de47')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"

  patch -p1 < "$srcdir/qpainter-include.patch"
}

build() {
  mkdir build
  cd build

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    "../$pkgname-v$pkgver"
  make
}

package() {
  cd "$srcdir/build"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 "$srcdir/$pkgname-v$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
