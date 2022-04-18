# Maintainer: Léopold Koprivnik Ibghy <skwal.net@gmail.com>
pkgname="rust-drawing-git"
pkgver=r2.28a2f5e
pkgrel=1
pkgdesc="Rust drawing allows you to draw incredible and admirable art in your terminal"
arch=('any')
url="https://github.com/SkwalExe/rust-drawing"
license=('MIT')
makedepends=("git" "cargo")
provides=("rust-drawing")
install=rust-drawing.install
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd rust-drawing
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
   cd rust-drawing
}

build() {
	cd rust-drawing
	cargo build --release
}


package() {
	cd rust-drawing
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm755 ./target/release/rust-drawing "$pkgdir/usr/bin/rust-drawing"
    install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
