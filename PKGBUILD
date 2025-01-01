# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Yousif Haidar <asd22.info@gmail.com>
pkgname=buildit-git
pkgver=1.0.0
pkgrel=1
epoch=
pkgdesc="A user-friendly, fast Make alternative for All Programming Languages written in Rust"
arch=('any')
url="https://github.com/neoapps-dev/buildit.git"
license=('GPL')
depends=('gcc-libs')
makedepends=('cargo')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::https://github.com/neoapps-dev/buildit/archive/refs/heads/main.tar.gz")
noextract=()
sha256sums=('SKIP')

pkgver() {
	cd "buildit-main"
	printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "buildit-main"
	cargo build --release
}

package() {
	cd "buildit-main"
	install -Dm755 "target/release/buildit" "$pkgdir/usr/bin/buildit"
	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
