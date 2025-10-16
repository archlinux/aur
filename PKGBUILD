# Maintainer: Zine Yu zine.xlws@gmail.com

pkgname=buck2-bin
pkgver=2025.10.13 # 请根据实际版本号修改
pkgrel=1
pkgdesc="A large-scale build system from Meta, developed in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/facebook/buck2"
license=('Apache' 'MIT')
depends=('zstd')
options=('!strip')

case "$CARCH" in
x86_64)
	_platform="x86_64-unknown-linux-gnu"
	sha256sums=('46667d48fcff3534239582a1524df7135d8d903328a4d73aaae15cf3c7ad39f8')
	;;
aarch64)
	_platform="aarch64-unknown-linux-gnu"
	sha256sums=('940ea779a7ea7b870cfe914c535a2866e9901fd8cc10317e028f8f2904ac5a05')
	;;
esac

source=("buck2-${_platform}.zst::https://github.com/facebook/buck2/releases/download/${pkgver}/buck2-${_platform}.zst")

package() {
	cd "$srcdir"

	_homedir=$(eval echo "~$USER")
	_cargo_bin_dir="$_homedir/.cargo/bin"

	mkdir -p "$pkgdir/$_cargo_bin_dir"

	zstd -d "buck2-${_platform}.zst" -c >buck2
	install -Dm755 buck2 "$pkgdir/$_cargo_bin_dir/buck2"
}

post_install() {
	echo "buck2 has been installed to ~/.cargo/bin/buck2"
	echo "Make sure ~/.cargo/bin/ is in your PATH"
}
