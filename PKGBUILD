# Maintainer: starccy <starccyz@gmail.com>

pkgname=andromeda-js-bin
_binname=andromeda
pkgver=0.1.14
pkgrel=1
pkgdesc='JS/TS runtime in Rust powered by Nova, with no transpilation needed'
arch=('x86_64')
url='https://github.com/tryandromeda/andromeda'
license=('MPL-2.0')
depends=('glibc' 'libgcc')
provides=("$_binname=$pkgver")
conflicts=("$_binname")
options=('!debug')
install="$pkgname.install"
source=("$_binname-$pkgver::$url/releases/download/$pkgver/andromeda-linux-amd64"
        "LICENSE.md-$pkgver::https://raw.githubusercontent.com/tryandromeda/andromeda/$pkgver/LICENSE.md")
noextract=("$_binname-$pkgver")
sha256sums=('96d415ab54330b9479b537a1825b9be4f4e3d2966352fe56096d9a4a2666b912'
            '2d52c2001a5d9ebc06802c9e5d8d8bd70ca8c57daf6a6c63e66156326597ac7a')

package() {
	install -Dm755 "$srcdir/$_binname-$pkgver" "$pkgdir/usr/bin/$_binname"
	install -Dm644 "$srcdir/LICENSE.md-$pkgver" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	local _bin="$pkgdir/usr/bin/$_binname"
	"$_bin" completions bash |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$_binname"
	"$_bin" completions zsh |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$_binname"
	"$_bin" completions fish |
		install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$_binname.fish"
}
