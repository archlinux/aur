# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat-bin
_pkgname=numbat
pkgver=1.20.0
pkgrel=2
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('x86_64' 'aarch64' 'i686')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=('hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=()
provides=('numbat')
conflicts=('numbat')
source_x86_64=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/sharkdp/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz::https://github.com/sharkdp/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64-unknown-linux-gnu.tar.gz")
source_i686=("$_pkgname-$pkgver-i686-unknown-linux-gnu.tar.gz::https://github.com/sharkdp/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu.tar.gz")

package() {
	cd "$_pkgname-v$pkgver-$CARCH-unknown-linux-gnu"
	install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 "LICENSE-MIT" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-MIT"
	install -Dm644 "LICENSE-APACHE" "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE-APACHE"
  mkdir "$pkgdir/usr/share/$_pkgname"
	cp -r "modules" "$pkgdir/usr/share/$_pkgname/modules/"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/$_pkgname/README.md"
	install -Dm644 "assets/numbat.desktop" "$pkgdir/usr/share/applications/numbat.desktop"
	install -Dm644 "assets/numbat.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/numbat.svg"

  for icon in $(ls assets/numbat-*x*png)
  do
    filename_without_prefix=${icon#*-}
    icon_size=${filename_without_prefix%.*}
    install -Dm644 "$icon" "$pkgdir/usr/share/icons/hicolor/$icon_size/apps/numbat.png"
  done
}

sha256sums_x86_64=('24e7e538001a9ca374ce0f161a78642b789997212036d2d26bdc5f6961e05902')
sha256sums_aarch64=('75179040cc1785ea61ba95cb40aa7dc0ed1902c48c99a207a229ac9a59bb34a1')
sha256sums_i686=('b3bd6f4d4609e089646af1336206859415397dd7055b5699ff36282e3b24b21f')
sha256sums_armv7h=('eb5d6b12c2ad34d437fca81949dd4b1126cba56d2ad112505dcd733832e405c2')
