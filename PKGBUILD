# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Maxs <max dot van dot den dot branden @t gmail dot com>

pkgname=solarus-quest-editor
pkgver=1.6.5
pkgrel=1
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=("i686" "x86_64")
url="https://www.solarus-games.org/"
license=("GPL" "custom")
depends=("solarus" "qt5-base" "qt5-tools" "glm")
makedepends=("cmake" "zip")
checkdepends=()
source=("https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c2e292bf34696968dfb0fe56fb21af8566b7a4001b84535c39e30ae7a3d9bb6e')

prepare() {
  cd "$srcdir/$pkgname-v$pkgver"

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
