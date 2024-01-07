# Maintainer: Krzysztof Bochm <bochmkrzysztof@gmail.com>
pkgname=kb-doom-software-renderer-git
pkgver=1.0.0.r.
pkgrel=1
epoch=
pkgdesc="Doom software renderer"
arch=(x86_64)
url="https://gitlab.com/bochmkrzysztof/doom-sr.git#tag=code-1.0"
license=('BSD')
groups=()
depends=()
makedepends=("rust" "cargo" "git")
checkdepends=()
optdepends=()
provides=(kb-doom-software-renderer)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

pkgver() {
    cd "${_pkgname}"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "doom-sr"
    env CARGO_INCREMENTAL=0 cargo build --release --locked
}

package() {
    cd "doom-sr"
    install -D -m755 "target/release/doom-sr" "$pkgdir/usr/bin/doom-sr"
}

