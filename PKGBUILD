# Maintainer: brain <brain@derelict.garden>
pkgname='ladybird'
pkgver='7040a8790c1a8cb4879abe04b1198ec6e64d1c92'
pkgrel=1
pkgdesc="A web browser built from scratch"
arch=('x86_64')
url="https://github.com/awesomekling/ladybird"
license=('BSD-2-Clause')
groups=()
depends=(qt6-base libgl)
makedepends=(cmake libgl ninja qt6-base qt6-tools qt6-wayland)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"https://github.com/awesomekling/$pkgname/archive/$pkgver.zip"
	"ladybird"
)
noextract=()
sha256sums=(
	'3a516fed8f605c427ef8131633ecd5833ac8f65195de577386cf1c3b07465553'
	'1d0fc030877f9074443ef71835518c043908360b5dac67d907d8b2317baa37c4'
)

build() {
  cd "$pkgname-$pkgver"

  cmake -GNinja -B Build
  cmake --build Build
  ninja -C Build
}

package() {
  cd "$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/lib" "$pkgdir/usr/share/serenity"
  cp -R Build/_deps/lagom-build/*.so* "$pkgdir/usr/lib/"
  cp -R Build/serenity/* "$pkgdir/usr/share/serenity/"
  install -Dm0755 Build/ladybird "$pkgdir/usr/share/serenity/Base/bin/$pkgname"
  install -Dm0755 "$srcdir/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
