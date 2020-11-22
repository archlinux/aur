# Maintainer: Daniel Peukert <daniel@peukert.cc>
_pkgname='rage'
pkgname="rust-$_pkgname-bin"
pkgver='0.5.0'
pkgrel='1'
pkgdesc='Rust implementation of the age encryption tool - binary version'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/str4d/$_pkgname"
license=('Apache' 'MIT')
depends=('fuse2' 'pcsclite')
optdepends=('bash-completion: Bash completion')
provides=("rust-$_pkgname")
conflicts=("rust-$_pkgname")
_releaseurl="$url/releases/download/v$pkgver"
source_x86_64=("$pkgname-$pkgver-$pkgrel-x86_64.deb::$_releaseurl/${_pkgname}_${pkgver}_amd64.deb")
source_armv6h=("$pkgname-$pkgver-$pkgrel-armv6h.deb::$_releaseurl/${_pkgname}_${pkgver}_armhf.deb")
source_armv7h=("$pkgname-$pkgver-$pkgrel-armv7h.deb::$_releaseurl/${_pkgname}_${pkgver}_armhf.deb")
source_aarch64=("$pkgname-$pkgver-$pkgrel-aarch64.deb::$_releaseurl/${_pkgname}_${pkgver}_arm64.deb")
source=("$pkgname-$pkgver-$pkgrel-LICENSE-MIT::$url/raw/v$pkgver/LICENSE-MIT")
sha256sums=('fe56c030c2d8c3404a37fe711cebb27ebea13d0aacf7e3524db4198335ad8cd1')
sha256sums_x86_64=('8b64505888d7502c4827aa796ea0913cad127e189854dae3dd51165364823213')
sha256sums_armv7h=('c9de9b74503e7be2658b5cb8a3bad2c9bcb79f63054936cfa34773b314abaefd')
sha256sums_aarch64=('f5365f23b489fef316492b493d7ee52d4fda20052404f87a22496dfec9ee5b3a')

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
