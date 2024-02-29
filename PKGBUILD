# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
pkgname=typstfmt-bin
pkgver=0.2.9
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
sha256sums_x86_64=('e9d191d5ddad6e6876eadc38e334fc5e1f8ea64a8aebc289a80216d0b8e5529d')
sha256sums_aarch64=('1396aaf5ec61bb35ff3ab71bc474fb3b164cdfb689ac74cda1f065636beb4363')
sha256sums_armv7h=('99fe1b5509052e3650396c8df9471319d48754c2a1f9c6dcff2e9549e78adad8')

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
