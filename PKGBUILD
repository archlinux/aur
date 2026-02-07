# Maintainer: João Freitas <joaj.freitas@gmail.com>
pkgname=numbat-bin
_pkgname=numbat
pkgver=1.21.0
pkgrel=1
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

sha256sums_x86_64=('e13ad7fa47d43a39052c824cad6d94d6fa71e4e5524c560fd99292d9f60a8f05')
sha256sums_aarch64=('d8ca2f94eb439d8091d5d3ed96a5f01e9252b161a06ee44aed38ef00374e3ef5')
sha256sums_i686=('e13ad7fa47d43a39052c824cad6d94d6fa71e4e5524c560fd99292d9f60a8f05')
