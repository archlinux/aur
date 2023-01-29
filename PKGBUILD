# Maintainer: jrd <jrd@enialis.net>
# Contributor: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Maxs <max dot van dot den dot branden @t gmail dot com>

pkgname=solarus-quest-editor
pkgver=1.6.5
pkgrel=2
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
license=("GPL" "custom")
depends=("solarus" "qt5-base" "qt5-tools" "glm")
makedepends=("cmake" "zip")
checkdepends=()
source=(
    "https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
    "https://gitlab.com/solarus-games/solarus-quest-editor/-/commit/baed9f61e7a9c7eeed1064f254032cb5f3344ffe.patch"
)
sha256sums=(
    'c2e292bf34696968dfb0fe56fb21af8566b7a4001b84535c39e30ae7a3d9bb6e'
    'a7e86920bd04a2d580d3da3df7ceb231205229798be5bdd0b6ee18f71c89d9a8'
)

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"
  patch -p1 -i "$srcdir/baed9f61e7a9c7eeed1064f254032cb5f3344ffe.patch"
  mkdir build
  cd build
  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    ..
}

build() {
  cd "$srcdir/$pkgname-v$pkgver/build"
  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver/build"
  make DESTDIR="${pkgdir}/" install
  install -Dm644 "$srcdir/$pkgname-v$pkgver/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
