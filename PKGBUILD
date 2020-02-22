# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-bin"
pkgver='0.3.1'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - binary version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2')
optdepends=('bash-completion: Bash completion')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
_releaseurl="$url/releases/download/v$pkgver"
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.tar.gz::$_releaseurl/${_pkgname}_${pkgver}_amd64.deb")
source_armv6h=("$pkgname-$pkgver-$pkgrel-armv6h.tar.gz::$_releaseurl/${_pkgname}_${pkgver}_armhf.deb")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.tar.gz::$_releaseurl/${_pkgname}_${pkgver}_armhf.deb")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.tar.gz::$_releaseurl/${_pkgname}_${pkgver}_arm64.deb")
source=("$pkgname-$pkgver-$pkgrel-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT")
sha256sums=('fe56c030c2d8c3404a37fe711cebb27ebea13d0aacf7e3524db4198335ad8cd1')
sha256sums_x86_64=('a7797da35aa8fe332b45213436f27163cce4726342248141640ebe35d4a49220')
sha256sums_armv7h=('3b23431dbe06981e3d90b79ca5fb3d952afa84a21fb3a75e69d464103574b9a3')
sha256sums_aarch64=('0442c207518b5f2e9c4f33017a20f3d4f786eb7f0115c00a21b1b511763ff566')

_sourcedirectory="$pkgname-$pkgver-$pkgrel"

prepare() {
	cd "$srcdir/"
	mkdir -p "$_sourcedirectory/"
	bsdtar -xf 'data.tar.xz' -C "$_sourcedirectory/"
}

package() {
	cd "$srcdir/$_sourcedirectory/"
	for _binary in "$_pkgname" "$_pkgname-keygen" "$_pkgname-mount"; do
		install -Dm755 "usr/bin/$_binary" "$pkgdir/usr/bin/$_binary"
		install -Dm644 "usr/share/bash-completion/completions/$_binary" "$pkgdir/usr/share/bash-completion/completions/$_binary"
		install -Dm644 "usr/share/fish/completions/$_binary.fish" "$pkgdir/usr/share/fish/vendor_completions.d/$_binary.fish"
		install -Dm644 "usr/share/zsh/functions/Completion/Debian/$_binary.zsh" "$pkgdir/usr/share/zsh/site-functions/_$_binary"
		install -Dm644 "usr/share/man/man1/$_binary.1.gz" "$pkgdir/usr/share/man/man1/$_binary.1.gz"
	done
	install -Dm644 "../$pkgname-$pkgver-$pkgrel-LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
