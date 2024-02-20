# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=typstfmt-bin
pkgver=0.2.7
pkgrel=1
pkgdesc="Basic formatter for the Typst language with a future!"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/astrale-sharp/typstfmt"
license=("MIT" "Apache-2.0")
provides=("typstfmt")
conflicts=("typstfmt-git")
changelog=$pkgname.changelog
source_x86_64=(
  $pkgname-x86_64-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-x86_64-unknown-linux-musl.tar.xz
  LICENSE-APACHE::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-APACHE
  LICENSE-MIT::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-MIT
)
source_aarch64=(
  $pkgname-aarch64-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-aarch64-unknown-linux-musl.tar.xz
  LICENSE-APACHE::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-APACHE
  LICENSE-MIT::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-MIT
)
source_armv7h=(
  $pkgname-armv7h-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-armv7-unknown-linux-musleabi.tar.xz
  LICENSE-APACHE::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-APACHE
  LICENSE-MIT::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-MIT
)
# checksum generate with 'makepkg -g'
sha256sums_x86_64=('ac0ec3a4a9099b9737d2a79b02173c4444835e4bc873eb7ed446fe5f5b87d2f4'
                   '3905892d35c90001cd11101d367d4073b773f30fa7ce868748969f4cc1fb24c2'
                   '7e302d0694378f3f9584985cf56db84d89b0bcb9f78d04381397349ff50162af')
sha256sums_aarch64=('80e990e47c5291c166cb1d5c6f22d17f7779b2644abf2543cef834c8dc3dfc10'
                    '3905892d35c90001cd11101d367d4073b773f30fa7ce868748969f4cc1fb24c2'
                    '7e302d0694378f3f9584985cf56db84d89b0bcb9f78d04381397349ff50162af')
sha256sums_armv7h=('3125f28e14d090f64d0b649060863c34b517ea9b1cc4e3da0e122797d3fe9a0c'
                   '3905892d35c90001cd11101d367d4073b773f30fa7ce868748969f4cc1fb24c2'
                   '7e302d0694378f3f9584985cf56db84d89b0bcb9f78d04381397349ff50162af')

build() {
	if [ $CARCH == "x86_64" ]; then
		mv "$srcdir/typstfmt-x86_64-unknown-linux-musl/" "$srcdir/$pkgname-$pkgver/"
	elif [ $CARCH == "aarch64" ]; then
		mv "$srcdir/typstfmt-aarch64-unknown-linux-musl/" "$srcdir/$pkgname-$pkgver/"
	elif [ $CARCH == "armv7h" ]; then
		mv "$srcdir/typstfmt-armv7-unknown-linux-musleabi/" "$srcdir/$pkgname-$pkgver/"
	else
		echo "Unknown architecture: $CARCH"
		exit 1
	fi
}

package() {
	cd "$srcdir/$pkgname-$pkgver/"
	install -Dm755 typstfmt "$pkgdir/usr/bin/typstfmt"
	cd "$srcdir/"
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
