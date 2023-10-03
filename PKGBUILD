# Maintainer: Ido Perlmuter <ido@ido50.net>
pkgname=sad-git
pkgver=r1912.d43aa8c
pkgrel=1
pkgdesc="Space Age seD"
arch=("x86_64")
url="https://github.com/ms-jpq/sad"
license=('MIT')
groups=()
depends=('gcc-libs')
makedepends=('git' 'rust')
optdepends=('fzf: for tui usage'
            'diff-so-fancy: diff colourizer'
            'git-delta-git: diff colourizer')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("git+https://github.com/ms-jpq/sad.git")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    cargo build --release --locked --all-features
}

check() {
	cd "$srcdir/${pkgname%-git}"
	cargo test --release --locked --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"
    cargo install --locked --all-features --root="${pkgdir}/usr" --path .
}
