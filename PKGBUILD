pkgname=ydcv-rs-git
_gitname="ydcv-rs"
pkgdesc="A Rust version of ydcv."
pkgver=0.3.1.55
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("ydcv")
provides=("ydcv")
url="https://github.com/farseerfc/ydcv-rs"
license=('MIT' 'GPLv2')
depends=("readline")
optdepends=("xsel: for X selection" "libdbus: for desktop notify")
makedepends=('git' 'cargo' 'python-pytoml')
source=('git://github.com/farseerfc/ydcv-rs.git')
sha256sums=('SKIP')

pkgver() {
	cd $_gitname
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd $_gitname
	cargo build --no-default-features --features "hyper notify-rust" --release
}

package() {
	cd $_gitname
	install -D -m755 "${srcdir}/${_gitname}/target/release/ydcv-rs" "${pkgdir}/usr/bin/ydcv"
}
