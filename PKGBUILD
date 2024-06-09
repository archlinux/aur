# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=typstfmt-bin
pkgver=0.2.10
pkgrel=1
pkgdesc="Basic formatter for the Typst language with a future!"
arch=("x86_64" "aarch64" "armv7h")
url="https://github.com/astrale-sharp/typstfmt"
license=("MIT" "Apache-2.0")
provides=("typstfmt")
conflicts=("typstfmt-git")
changelog=$pkgname.changelog
source=(
	LICENSE-APACHE::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-APACHE
	LICENSE-MIT::https://raw.githubusercontent.com/astrale-sharp/typstfmt/main/LICENSE-MIT
)
source_x86_64=(
	$pkgname-x86_64-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-x86_64-unknown-linux-musl.tar.xz
)
source_aarch64=(
	$pkgname-aarch64-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-aarch64-unknown-linux-musl.tar.xz
)
source_armv7h=(
	$pkgname-armv7h-$pkgver.tar.xz::https://github.com/astrale-sharp/typstfmt/releases/download/$pkgver/typstfmt-armv7-unknown-linux-musleabi.tar.xz
)
# checksum generate with 'makepkg -g'
sha256sums=('3905892d35c90001cd11101d367d4073b773f30fa7ce868748969f4cc1fb24c2'
            '7e302d0694378f3f9584985cf56db84d89b0bcb9f78d04381397349ff50162af')
sha256sums_x86_64=('15211663a65a5cff67390480d21618e11aed54defaa00cde2fde3a3ecf812239')
sha256sums_aarch64=('775ebd2a5905b7b50b8b08c025bbf0ca7d272ee2b7a2b600d2ce2b0ea14baa39')
sha256sums_armv7h=('274cb1dbb18c72a84eed47301279b0a39cfe9b44330633ad56d952e5a0336b03')

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