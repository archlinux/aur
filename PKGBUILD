# Maintainer: Maxs <max dot van dot den dot branden @t gmail dot com>
pkgname="solarus-quest-editor"
pkgver="1.6.0"
pkgrel="1"
epoch=
pkgdesc="A graphical user interface to create and modify quests for the Solarus engine."
arch=("i686" "x86_64")
url="http://www.solarus-games.org/"
license=("GPL" "custom")
groups=()
depends=("solarus" "qt5-base" "qt5-tools")
makedepends=("cmake" "zip")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://gitlab.com/solarus-games/$pkgname/-/archive/v$pkgver.tar.gz")
noextract=()
md5sums=("405466fc52f7d22cb271bdf6e4193b16")
commit=("cfbcf8a3bf22968c0fef1b431edcf2d19be7c1e3")

build() {
  cd "$srcdir/$pkgname-v$pkgver-$commit"

  cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX="/usr" .
  make
}

package() {
  cd "$srcdir/$pkgname-v$pkgver-$commit"

  make DESTDIR="${pkgdir}/" install
  install -Dm644 "license.txt" "$pkgdir/usr/share/licences/$pkgname/license.txt"
  install -Dm644 "images/logo/sqe-logo.png" "$pkgdir/usr/share/pixmaps/sqe-logo.png"
  install -Dm644 "resources/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

