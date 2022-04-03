# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Julia <juliag2 (at) protonmail (dot) com>
pkgname=fbkeyboard
pkgver=0.4
pkgrel=2
pkgdesc="A framebuffer softkeyboard for touchscreen devices"
arch=(any)
url="https://github.com/bakonyiferenc/fbkeyboard"
license=('GPL3')
source=("https://github.com/bakonyiferenc/$pkgname/archive/refs/tags/$pkgver.zip"
        "patch-archlinux-font-dir.patch")
sha256sums=("ad05e22d6fc1c74f44e7fb3a2b4578c2650d1a09a012237d444e4e7938a023b5"
           "37ac258adce9085de2d858e6b04b05a459edcbd086018e49a706933d9e68f4c2")

build() {
	cd "$pkgname-$pkgver"
	patch -Np1 -i "$srcdir"/patch-archlinux-font-dir.patch
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.1" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
