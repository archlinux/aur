# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=lapin-git
pkgver=r75.a31e5c4
pkgrel=1
pkgdesc="Terminal strategy game about a rabbit"
arch=('x86_64')
url="https://github.com/Canop/lapin"
license=('MIT')
depends=('gcc-libs')
makedepends=('git' 'cargo')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=()
install=
source=("lapin::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
	cd "$srcdir/${pkgname%-git}"
    cargo fetch --locked
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cargo build --release --locked --all-features
}

check() {
	cd "$srcdir/${pkgname%-git}"
    cargo test --release --locked
}

package() {
	cd "$srcdir/${pkgname%-git}"
    install -Dm755 target/release/${pkgname%-git} -t "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
