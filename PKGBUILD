# Maintainer: Mei P. sweetbabyalaska@gmail.com
# MAINTAINER: Contact Mei at sweetbabyalaska@gmail.com or sweetbbak on github

_pkgname=mip.rs
__pkgname=mip
pkgname=$_pkgname
pkgver=v0.2.2
pkgrel=1
pkgdesc="Markdown Instant Preview aka mip is a fast and bloatless markdown document viewer. Mip uses a webview window to render the markdown. I wrote mip to preview my markdown files which I write in vim."
arch=("x86_64")
url="https://github.com/mipmip/mip.rs"
license=('MIT')
depends=()
makedepends=('cargo' 'git')
provides=("mip")
conflicts=("mip")
source=("git+https://github.com/mipmip/mip.rs.git")
md5sums=('SKIP')

prepare() {
	cd "$_pkgname"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --release
}

package() {
	# install cargo binary to users bin
	cd "$_pkgname"
	install -Dm755 target/release/$__pkgname \
		-t "${pkgdir}/usr/bin"
	# install license to license directory
    install -Dm644 LICENSE \
	    "$pkgdir/usr/share/licenses/$_pkgname"
}
