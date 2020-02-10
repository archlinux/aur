# Maintainer: Daniel Peukert <dan.peukert@gmail.com>
_pkgname='rage'
pkgname="rust-$_pkgname-bin"
pkgver='0.3.0'
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
sha256sums_x86_64=('60654f56ed04bc8a94dab7b76fe6078b06cd61806abfd45736bf13db84ea0d21')
sha256sums_armv7h=('eb1e4b777254a2ba93580c2e7a0811131eed1e74cb09e6616f48f503b023ffbd')
sha256sums_aarch64=('6d23708ab69b3730e21bb6907f1b5075fe140145c3585c15238b087f018ea73b')

_sourcedirectory="$pkgname-$pkgver-$pkgrel"

prepare() {
	cd "$srcdir/"
	mkdir "$_sourcedirectory/"
	tar -xJf 'data.tar.xz' -C "$_sourcedirectory/"
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
