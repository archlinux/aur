# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat-bin
_pkgname=numbat
pkgver=1.16.0
pkgrel=1
pkgdesc="A statically typed programming language for scientific computations with first class support for physical dimensions and units"
arch=('x86_64')
url="https://github.com/sharkdp/numbat"
license=('MIT' 'Apache-2.0')
depends=()
makedepends=()
provides=('numbat')
conflicts=('numbat')
source=("$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz::https://github.com/sharkdp/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=(
  '616e56494d7f2eb35a37cbb34aff257a9ee19cf10895197d74bb9b3424aa81c3'
)

package() {
	cd "$_pkgname-v$pkgver-x86_64-unknown-linux-gnu"
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

